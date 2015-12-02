function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

TRAKE = {

  grid: {
    height: 640,
    width: 640,
    rows: 100,
    cols: 100,
    border: 2,
    color: "#eee"
  },

  setCell: function(x,y,color) {
    var cellWidth = this.grid.width/this.grid.cols,
        cellHeight = this.grid.height/this.grid.rows,
        border = this.grid.border;

    this.ctx.fillStyle = color;
    this.ctx.fillRect(
        x*cellWidth + (border/2), // X
        y*cellHeight + (border/2), // Y
        cellWidth - border, // width
        cellHeight - border //height
      );
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

  updateGrid: function(gridJSON) {

  },

  init: function() {
    this.ctx = document.querySelector('canvas').getContext('2d');
    this.makeGrid();
  }

}



TRAKE.init();



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
    rows: 100,
    cols: 100
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
        y: 11
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