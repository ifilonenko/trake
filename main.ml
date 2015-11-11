let handler grid player =
  print_endline (player ^ " died.")

let s = Game.create_from_json "http://0.0.0.0" 3110 "" handler
let () = Game.start s
