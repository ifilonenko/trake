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
    height: 500,
    width: 500,
    rows: 20,
    cols: 20,
    border: 4,
    color: "#cccccc"
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

  init: function() {
    this.ctx = document.querySelector('canvas').getContext('2d');
    this.makeGrid();
  }

}

var socket = io('http://localhost:3110');

// var WebSocketClient = require('websocket').client,
//     client = new WebSocketClient();

// client.on('connect', function(connection) {
//   console.log('WebSocket Client Connected');
//   connection.on('error', function(error) {
//     console.log("Connection Error: " + error.toString());
//   });
//   connection.on('close', function() {
//     console.log('echo-protocol Connection Closed');
//   });
//   connection.on('message', function(message) {
//     TRAKE.game.color = getRandomColor();
//     TRAKE.init();

//     if (message.type === 'utf8') {
//       console.log("Received: '" + message.utf8Data + "'");
//     }
//   });

//   function sendNumber() {
//     if (connection.connected) {
//       var number = Math.round(Math.random() * 0xFFFFFF);
//       connection.sendUTF(number.toString());
//       setTimeout(sendNumber, 1000);
//     }
//   }
//   sendNumber();
// });

// client.connect(SERVER_URL);