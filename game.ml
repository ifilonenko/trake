open Websocket_lwt
open Lwt
open Conduit_lwt_unix

type rules = {
  trail_length: int;
  ticks_per_second: float;
  food_probability: float;
}

type t' = {
  rules: rules;
  grid: Grid.t;
  callbacks: (int * (Frame.t -> unit Lwt.t)) list;
  host: string;
  port: int;
  started: bool;
}

type t = t' ref

let create a p g r =
  ref {
    rules = r;
    host = a;
    port = p;
    grid = g;
    callbacks = [];
    started = false;
  }

let create_from_json a p j r =
  ref {
    rules = r;
    host = a;
    port = p;
    grid = Grid.from_json_file j;
    callbacks = [];
    started = false;
  }

(* TCP port this game is running on *)
let port s =
  !s.port

(* Web address to access this game *)
let host s =
  !s.host

let grid s =
  !s.grid

let rules s =
  !s.rules


let receive_frame s player_id content =
  ()

(* Sends JSON of game board to all humans and the Grid.t instance to AI users *)
let update_players s =
  ()

let send s id content =
  let handler = List.assoc !s.callbacks id in
  handler (Frame.create ~opcode:Frame.Opcode.Text ~content ())

let rec tick s () =
  Lwt_unix.sleep (1. /. (rules s).ticks_per_second) >>= fun () ->
  let rls = rules s in
  let g = grid s in
  (* Move all players in their direction *)
  Grid.act g;

  (* Spawn food based on a random number *)
  (if Random.float 1. <= rls.food_probability then
    Grid.spawn_food g
  );

  (* Send players new board *)
  let () = update_players s in

  print_endline "did tick";

  return ()
  (* Tick again *)
  >>= (tick s)

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
      | Opcode.Ping -> send (Frame.create ~opcode:Opcode.Pong ()) >>= response
      | Opcode.Text ->  receive_frame s id (Yojson.Basic.from_string frame.content);
                        return () >>= response
      | Opcode.Close -> send (Frame.close 1000)
      | _ -> send (Frame.close 1002)
    in
    response ()
  in

  (* start our server locally on port 3110 *)
  let uri = Uri.make ~scheme:"http" ~host:(host s) ~port:(port s) () in
  let _ = serve uri handler in

  (* Keep the runloop alive *)
  (* TODO: Remove this after we add the webservice, or itll block *)
  Lwt_main.run (tick s ())
