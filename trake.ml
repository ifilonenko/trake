(* opam pin add lwt 2.4.8 *)
(* sudo apt-get install -qq -yy libgmp-dev *)
(* opam install "websocket=2.1" *)
(* cs3110 compile -p yojson,lwt.unix,websocket.lwt,core -thread trake *)

let g = Grid.create (30,30)
let s = Game.create "0.0.0.0" 3110 g Game.{ trail_length = 15; ticks_per_second = 50.; food_probability = 0.5; }
let () = Server.serve "./" "0.0.0.0" 8080
let _ = Lwt_main.run (Game.start s)
