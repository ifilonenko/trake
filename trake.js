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
    this.setCell(food.x, food.y, this.grid.foodColor);
  },

  makePlayers: function(players) {
    var self = this;

    players.map(function(player) {
      var id = player.id;
      console.log(player);

      self.players[id] = player;
      self.players[id].tail = [player.position];
      self.setCell(player.position.x, player.position.y, player.color);
    });
  },

  updatePlayers: function(players) {
    var self = this;

    players.map(function(player) {
      var p = self.players[player.id],
          tailDiff;

      // Convert head tile to a tail tile
      self.setCell(p.position.x, p.position.y, p.color, true);

      // Copy over new state data
      for (field in player) {
        p[field] = player[field]
      };

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

  init: function() {
    this.ctx = document.querySelector('canvas').getContext('2d');
  }

}


var tick0 = {
  type: "Initial",
  walls: [
    {x: 0, y: 0},
    {x: 1, y: 0},
    {x: 2, y: 0},
    {x: 3, y: 0}
  ],
  food: {
    x: 3,
    y: 3
  },
  dimensions: {
    rows: 20,
    cols: 20
  },
  players: [
    {
      id: 0,
      label: "Player 1",
      color: "#b31b1b",
      direction: "Up",
      tail_length: 5,
      score: 0,
      position: {
        x: 10,
        y: 10
      },
      human: true
    },
    {
      id: 1,
      label: "Player 2 (AI)",
      color: "#008800",
      direction: "Down",
      tail_length: 5,
      score: 0,
      position: {
        x: 11,
        y: 17
      },
      human: false
    }
  ]
}

var tick1 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 9
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 11,
        y: 18
      }
    }
  ]
}

var tick2 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 8
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 10,
        y: 18
      }
    }
  ]
}

var tick3 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 7
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 9,
        y: 18
      }
    }
  ]
}

var tick4 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 6
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 8,
        y: 18
      }
    }
  ]
}

var tick5 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 5
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 7,
        y: 18
      }
    }
  ]
}

var tick6 = {
  type: "Update",
  food: {
    x: 3,
    y: 3
  },
  players: [
    {
      id: 0,
      direction: "Up",
      tail_length: 5,
      score: 2,
      position: {
        x: 10,
        y: 4
      }
    },
    {
      id: 1,
      direction: "Left",
      tail_length: 5,
      score: 0,
      position: {
        x: 6,
        y: 18
      }
    }
  ]
}

var tickN = {
  type: "End",
  final_scores: [
    {id: 0, score: 200},
    {id: 1, score: 50}
  ]
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



TRAKE.init();
TRAKE.initialTick(tick0);
window.setTimeout(function(){TRAKE.updateTick(tick1)},1000);
window.setTimeout(function(){TRAKE.updateTick(tick2)},2000);
window.setTimeout(function(){TRAKE.updateTick(tick3)},3000);
window.setTimeout(function(){TRAKE.updateTick(tick4)},4000);
window.setTimeout(function(){TRAKE.updateTick(tick5)},5000);
window.setTimeout(function(){TRAKE.updateTick(tick6)},6000);
