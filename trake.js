TRAKE = {

  ctx: null,

  players: {},

  grid: {
    height: 640,
    width: 640,
    rows: 50,
    cols: 50,
    border: 3,
    color: "#eee",
    wallColor: "#333",
    foodColor: "purple"
  },

  setCell: function(x,y,color,hollow) {
    var cellWidth = this.grid.width/this.grid.cols,
        cellHeight = this.grid.height/this.grid.rows,
        border = this.grid.border;

    // Clear space to prevent rendering artifacts
    this.ctx.clearRect(
        x*cellWidth, // X
        y*cellHeight, // Y
        cellWidth, // width
        cellHeight //height
      );

    this.ctx.fillStyle = color;
    this.ctx.fillRect(
        x*cellWidth + (border/2), // X
        y*cellHeight + (border/2), // Y
        cellWidth - border, // width
        cellHeight - border //height
      );

    if (hollow) {
      this.ctx.fillStyle = this.grid.color;
      this.ctx.fillRect(
          x*cellWidth + (border*1.5), // X
          y*cellHeight + (border*1.5), // Y
          cellWidth - border*3, // width
          cellHeight - border*3 //height
        );
    }
  },

  makeGrid: function() {
    var cellWidth = this.grid.width/this.grid.cols,
        cellHeight = this.grid.height/this.grid.rows,
        border = this.grid.border;

    var i = this.grid.rows*this.grid.cols+1;
    while (i--) {
      this.setCell(i % this.grid.rows, Math.floor(i/this.grid.cols), this.grid.color);
    }
  },

  updateFood: function(food) {
    if (typeof food !== "undefined") {
      this.setCell(food.x, food.y, this.grid.foodColor);
    }
  },

  makePlayers: function(players) {
    var self = this;

    players.map(function(player) {
      var id = player.id;
      console.log(player);

      self.players[id] = player;
      self.players[id].tail = [player.position];
      if (player.alive) {
        self.setCell(player.position.x, player.position.y, player.color);
      }
    });
  },

  killPlayer: function(player) {
    var self = this;

    if (player.tail_length > -1) {
      self.setCell(player.position.x, player.position.y, self.grid.color);
      player.tail.map(function(segment) {
        self.setCell(segment.x, segment.y, self.grid.color);
      });
      player.tail_length = -1;
    }
  },

  updatePlayers: function(players) {
    var self = this;

    players.map(function(player) {
      var p = self.players[player.id], tailDiff;

      // Convert head tile to a tail tile
      self.setCell(p.position.x, p.position.y, p.color, true);

      // Copy over new state data
      for (field in player) {
        p[field] = player[field]
      };

      if (!player.alive) {
        self.killPlayer(p);
        return
      }

      // Move trake
      p.tail.push(p.position);
      self.setCell(p.position.x, p.position.y, p.color);

      // Remove tail segments beyond tail length
      if (p.tail_length < p.tail.length) {
        tailDiff = p.tail.length - p.tail_length;

        p.tail.slice(0,tailDiff).map(function(emptyCell) {
          self.setCell(emptyCell.x, emptyCell.y, self.grid.color);
        });

        p.tail = p.tail.slice(tailDiff);
      }
    });
  },

  initialTick: function(jsonData) {
    var self = this;

    // Init grid
    self.grid.rows = jsonData.dimensions.rows;
    self.grid.cols = jsonData.dimensions.cols;
    self.makeGrid();
    jsonData.walls.map(function(wall) {
      self.setCell(wall.x, wall.y, self.grid.wallColor);
    });

    // Update Game
    self.updateFood(jsonData.food);
    self.makePlayers(jsonData.players);
  },

  updateTick: function(jsonData) {
    this.updateFood(jsonData.food);
    this.updatePlayers(jsonData.players);
  },

  changeDirection: function(direction) {
    client.send(JSON.stringify({type: "turn", direction: direction}));
  },

  init: function() {
    var self = this;

    self.ctx = document.querySelector('canvas').getContext('2d');

    document.onkeyup = function(e) {
      if (e.keyCode === 87 || e.keyCode === 38) {
        self.changeDirection('up');
      } else if (e.keyCode === 65 || e.keyCode === 37) {
        self.changeDirection('left');
      } else if (e.keyCode === 83 || e.keyCode === 40) {
        self.changeDirection('down');
      } else if (e.keyCode === 68 || e.keyCode === 39) {
        self.changeDirection('right');
      }
    };
  }

}

// Join Protocol
//
//
// Joining during waiting period
// =====
// Client: CONNECT
// Server: ACCEPT CONNECTION
// Client: {player_name: "Eric"}
// Server: {id: 0}
// [Pause Until Waiting Period Ends]
// Server: Tick0
// [Pause 5 Seconds]
// Server: Tick1
// Client: {id: 0, direction: "Up"}
// Server: Tick2
// ...

// Joining during running game
// =====
// Client: CONNECT
// Server: ACCEPT CONNECTION
// Client: {player_name: "Eric"}
// Server: {id: 0}
// [Pause Until Current Game Ends]
// Server: Tick0
// [Pause 5 Seconds]
// Server: Tick1
// Client: {id: 0, direction: "Up"}
// Server: Tick2
// ...

var SERVER_URL = "ws://" + location.hostname + ":3110/websocket";


var client = new WebSocket(SERVER_URL, []);

client.onerror = function() {
    console.log('Connection Error');
};

client.onopen = function() {
    console.log('WebSocket Client Connected');
    TRAKE.init();
    client.send(JSON.stringify({type: "join", player_name: "client"}));
};

client.onclose = function() {
    console.log('client closed');
};

client.onmessage = function(e) {
    var data = JSON.parse(e.data);
    console.log(data);

    if (data.type === "initial") {
      TRAKE.initialTick(data);
    } else if (data.type === "update") {
      TRAKE.updateTick(data);
    }else if (data.type === "end") {
      alert('Game Over')
    }
};

window.onbeforeunload = function() {
    client.onclose = function () {}; // disable onclose handler first
    client.close()
};