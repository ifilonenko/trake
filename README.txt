In order to run the game, Trake, the following steps must be taken:

1. “opam pin add lwt 2.4.8”
2. “sudo apt-get install -qq -yy libgmp-dev”
3. “opam install "websocket=2.1””
4. “cs3110 compile -p yojson,lwt.unix,websocket.lwt,core -thread trake”
5. “cs3110 run trake.ml”

From this point, you will need to open up a web browser and type in the IP Address of your VM on port 8080. One player should press Start Game to begin the game.