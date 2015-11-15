(* opam pin add lwt 2.4.8 *)
(* opam install "websocket=2.1" *)
(* cs3110 compile -p yojson,lwt.unix,websocket.lwt,core -thread trake *)

let g = Grid.create (100,100)
let s = Game.create "0.0.0.0" 3110 g Game.{ trail_length = 5; ticks_per_second = 60.; food_probability = 0.2; }
let () = Game.start s
