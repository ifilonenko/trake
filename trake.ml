(* opam pin add lwt 2.4.8 *)
(* sudo apt-get install -qq -yy libgmp-dev *)
(* opam install "websocket=2.1" *)
(* cs3110 compile -p yojson,lwt.unix,websocket.lwt,core -thread trake *)

let g = Grid.create (20,20)
let s = Game.create "0.0.0.0" 3110 g
  Game.{ trail_length = 5;
          ticks_per_second = 5.;
          food_probability = 0.5;
          time_between_games = 5.;
          game_over_handler= fun hum ai -> (hum + ai <= 1) || hum = 0
        }
let () = Server.serve "./" "0.0.0.0" 8080
let _ = Lwt_main.run (Game.start s)
