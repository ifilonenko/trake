open Websocket_lwt
open Lwt
open Conduit_lwt_unix

type msg = Initial | Update | Join of string | Turn of Util.direction | End | Confirm of bool | Unknown

type rules = {
  trail_length: int;
  ticks_per_second: float;
  food_probability: float;
}

type t = {
  rules: rules;
  mutable grid: Grid.t;
  mutable callbacks: (int * (Frame.t -> unit Lwt.t)) list;
  host: string;
  port: int;
  mutable started: bool;
}

let create a p g r =
  {
    rules = r;
    host = a;
    port = p;
    grid = g;
    callbacks = [];
    started = false;
  }

let create_from_json a p j r =
  {
    rules = r;
    host = a;
    port = p;
    grid = Grid.from_json_file j;
    callbacks = [];
    started = false;
  }

(* TCP port this game is running on *)
let port s =
  s.port

(* Web address to access this game *)
let host s =
  s.host

let grid s =
  s.grid

let rules s =
  s.rules

let add_handler s id handler =
  s.callbacks <- (id, handler)::s.callbacks

let pong s id =
  let handler = List.assoc id s.callbacks in
  handler (Frame.create ~opcode:Frame.Opcode.Pong ())

let send s id content =
  let handler = List.assoc id s.callbacks in
  handler (Frame.create ~opcode:Frame.Opcode.Text ~content ())

(* Turns json into msg *)
let parse msg =
  let open Yojson.Basic.Util in
  try
    (match msg with
    | `Assoc _ -> (
      let t = msg |> member "type" in
      match t with
      | `String "turn" -> Turn (Util.direction_of_string (msg |> member "direction" |> to_string))
      | `String "join" -> Join (msg |> member "player_name" |> to_string)
      | _ -> Unknown
      )
    | _ -> Unknown)
  with
  | _ -> Unknown

(* Serializes and sends a msg tuple to the client with id *)
let message s id msg =
  let json = match msg with
  | Initial -> `String "Hi!"
  | Update -> `String "Hi!"
  | End -> `Assoc [("type", `String "end")]
  | Confirm a -> `Assoc [("type", `String "confirm"); ("accepted", `Bool a); ("id", `Int id)]
  | _ -> failwith "Invalid Message to send"
  in
  send s id (Yojson.Basic.to_string json)

let rec tick s () =
  Lwt_unix.sleep (1. /. (rules s).ticks_per_second) >>= fun () ->

  let rls = rules s in
  let g = grid s in

  (* Move AI players *)
  List.iter (fun p -> if (Player.is_ai p) then Ai.new_direction p s.grid) (Grid.players s.grid);

  (* Move all players in their direction *)
  Grid.act g;

  (* Spawn food based on a random number *)
  (if Random.float 1. <= rls.food_probability then
    Grid.spawn_food g
  );

  (* Send players new board *)
  let () = send_all_players s Update in

  return ()

  (* Tick again *)
  >>= (tick s)

and start_ticking s () =
  (* create phantom AI players *)
  (while List.length (Grid.players s.grid) < 4 do
    s.grid <- Grid.add_player s.grid (Player.create_ai (rules s).trail_length (255,0,0));
  done);

  let () = send_all_players s Initial in

  tick s ()

(* Handles incoming communication from clients *)
and receive_frame s id content =
    let open Yojson.Basic.Util in
    match content with
    | `Assoc _ -> (
      let input = parse content in
      match input with
      | Turn d ->
        let p = Grid.player_with_id (grid s) id in
        (match p with
        | Some x -> Player.update_direction x d; message s id (Confirm s.started)
        | _ -> message s id (Confirm false))

      | Join name ->
        (
          (* start game in 10 seconds after first player joins *)
          if List.length (Grid.players s.grid) = 0 then
            let _ = Lwt_unix.sleep 10. >>= (start_ticking s) in
            ()
          );

        s.grid <- Grid.add_player (grid s) (Player.create_human id (rules s).trail_length (0,0,0) name);
        message s id (Confirm s.started)
      | _ -> send s id "{ \"type\": \"error\", \"message\": \"Invalid message\" }"
      )
    | _ -> send s id "{ \"type\": \"error\", \"message\": \"Invalid message\" }"

(* Sends JSON of game board to all humans and the Grid.t instance to AI users *)
and send_all_players s msg =
  let (f, t) =
  match msg with
  | Initial -> (Grid.to_json_initial, "initial")
  | Update -> (Grid.to_json_update, "update")
  | _ -> failwith "Cant send all players that message"
  in

  let js = Yojson.Basic.Util.to_string (match f s.grid with
  | `Assoc x -> `Assoc (("type", `String t)::x)
  | x -> x)
  in

  List.iter (fun x -> let _ = send s (Player.id x) js in ()) (Grid.players s.grid)

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
    (* keep a reference to the send function for this player *)
    let () = add_handler s id send in

    let rec response () =
      recv () >>= fun frame ->

      match frame.opcode with
      | Opcode.Ping -> send (Frame.create ~opcode:Opcode.Pong ()) >>= response
      | Opcode.Text -> receive_frame s id (Yojson.Basic.from_string frame.content) >>= response
      | Opcode.Close ->
        let p = Grid.player_with_id s.grid id in

        (match p with
        | Some x -> Player.kill x
        | _ -> ());

        send (Frame.close 1000)
      | _ -> send (Frame.close 1002)
    in
    response ()
  in

  (* start our server locally on port 3110 *)
  let uri = Uri.make ~scheme:"http" ~host:(host s) ~port:(port s) ~path:"websocket" () in
  serve uri handler
