open Printf

let serve dir host port =
  let cmd = sprintf "cohttp-server-lwt -p %i -s %s %s" port host dir in
  (* use the cohttp-server-lwt binary included with cohttp to spawn the server *)
  let _ = Unix.open_process cmd in
  ()
