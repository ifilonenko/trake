open Websocket_lwt
open Lwt
open Conduit_lwt_unix

type t = unit

let create a p g =
  ()

let create_from_json a p j h =
  ()

(* TCP port this game is running on *)
let port s =
  3110

(* Web address to access this game *)
let host s =
  "0.0.0.0"

(* starts this server *)
let start s =
  (* Creates a server instance with the given handler *)
  let serve uri handler =
    Resolver_lwt.resolve_uri ~uri Resolver_lwt_unix.system >>= fun endp ->
    Conduit_lwt_unix.(endp_to_server ~ctx:default_ctx endp >>= fun server ->
    establish_server ~ctx:default_ctx ~mode:server handler)
  in

  (* Handles communication between client/server *)
  let handler id req recv send =
    let open Frame in
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
  in

  (* start our server locally on port 3110 *)
  let uri = Uri.make ~scheme:"http" ~host:(host s) ~port:(port s) () in
  let _ = serve uri handler in

  (* Keep the runloop alive *)
  Lwt_main.run (fst (Lwt.wait ()))

let tick s =
  s

let grid s =
  failwith "Unimplemented"
