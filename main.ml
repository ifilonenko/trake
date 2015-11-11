open Websocket_lwt
open Lwt
open Conduit_lwt_unix

(* Creates a server instance with the given handler *)
let serve uri handler =
  Resolver_lwt.resolve_uri ~uri Resolver_lwt_unix.system >>= fun endp ->
  Conduit_lwt_unix.(endp_to_server ~ctx:default_ctx endp >>= fun server ->
  establish_server ~ctx:default_ctx ~mode:server handler)

(* Handles communication between client/server *)
let handler id req recv send =
  let open Frame in
  print_endline "got some shit";
  print_int id;
  let rec response () =
    recv () >>= fun frame ->
    match frame.opcode with
    | Opcode.Ping -> print_endline "got ping"; send (Frame.create ~opcode:Opcode.Pong ())
    | Opcode.Text -> print_endline ("got text" ^ frame.content); send (Frame.create ~opcode:Opcode.Text ~content:"WORD!" ()) >>= response
    | Opcode.Binary -> print_endline "got Binary"; send (Frame.create ~opcode:Opcode.Pong ())
    | Opcode.Continuation -> print_endline "got continuation"; send (Frame.create ~opcode:Opcode.Pong ())
    | _ -> print_endline "got other"; send (Frame.close 1002)
  in
  response ()

(* start our server locally on port 3110 *)
let uri = Uri.of_string "http://0.0.0.0:3110"
let _ = serve uri handler

(* Keep the runloop alive *)
let () = Lwt_main.run (fst (Lwt.wait ()))
