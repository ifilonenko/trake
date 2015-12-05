exception Invalid_Grid

module SCORES = struct
  let kill = 1000
  let food = 100
  let tick = 2
end

type t = {
    walls: (Util.cell * Util.cell_status) list;
    mutable food: Util.cell option;
    dimensions: int * int;
    players: Player.t list;
}

(* the json file has a list of wall points and a key for dimensions *)
(* {
  walls: [[0, 0], ...]
  dimensions: { cols: 20, rows: 20 }
} *)
let from_json_file path =
  let open Yojson.Basic.Util in
  let js = Yojson.Basic.from_file path in
  let walls = convert_each (fun c -> (Util.cell_of_json c, Util.Wall)) (member "walls" js) in
  let dimensions = member "dimensions" js in
  let dims = (dimensions |> member "cols" |> to_int, dimensions |> member "rows" |> to_int) in

  {
    players = [];
    food = None;
    walls = walls;
    dimensions = dims;
  }

let create dims =
  let (w, h) = dims in
  if (w < 20 || h < 20) then raise Invalid_Grid
  else
    let rec gen_vert x y =
      if y > 0 then
          ((x, y), Util.Wall)::(gen_vert x (y - 1))
      else
        []
    in
    let rec gen_horiz x y =
      if x > 0 then
        ((x, y), Util.Wall)::(gen_horiz (x - 1) y)
      else
        []
  in

  {
    players = [];
    food = None;
    walls = (gen_vert 0 (h - 1)) @ (gen_vert (w - 1) (h - 1)) @
            (gen_horiz (w - 1) 0) @ (gen_horiz (w - 1) (h - 1)) @
            [((0, 0), Util.Wall)];
    dimensions = dims;
  }

let dimensions g =
  g.dimensions

let status_of_cell g c =
  let (cols, rows) = (dimensions g) in
  let (x, y) = c in

  if x < 0 || x >= cols || x < 0 || y >= rows then
    Util.Wall
  else
    try
      let rec trail_helper players =
        match players with
        | h::t -> (let rec match_trail trl =
                    match trl with
                    | (x, y)::tl -> if ((fst c) = x && (snd c) = y)
                                    then Util.Trail (Player.id h)
                                    else match_trail tl
                    | [] -> trail_helper t
                  in
                  match_trail (Player.tail h))
        | [] -> Util.Empty
      in
      let rec player_helper players =
        match players with
        | h::t when (Player.is_alive h) ->
          if ((fst c) = (fst (Player.position h)) &&
               (snd c) = (snd (Player.position h))) then Util.Player (Player.id h)
          else
              player_helper t
        | h::t -> player_helper t
        | [] -> trail_helper g.players
      in
      let food_helper f =
        match f with
        | Some (x, y) -> if ((fst c) = x && (snd c) = y) then Util.Food
                         else player_helper g.players
        | None -> player_helper g.players
      in
      let rec wall_helper lst =
        match lst with
        | ((x, y), cs)::t -> if ((fst c) = x && (snd c) = y) then cs
                             else wall_helper t
        | [] -> food_helper g.food
      in
      wall_helper g.walls
    with
    | _ -> Util.Wall

(*TODO: Someone tell me what this is for?*)
let helper g (x, y) =
  status_of_cell g (x, y) = Util.Empty

let rec add_player g p =
  (* TODO: Set the player's position and direction*)
  let () = Random.self_init() in
  let x = Random.int (fst g.dimensions) in
  let y = Random.int (snd g.dimensions) in
  if (status_of_cell g (x, y) <> Util.Empty) then
    add_player g p
  else
    if (helper g (x, y + 1) && helper g (x, y + 2) &&
       helper g (x, y + 3) && helper g (x, y + 4))
    then
      let () = Player.update_position p (x, y) in
      let _ = Player.update_direction p Util.Down in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x, y - 1) && helper g (x, y - 2) &&
       helper g (x, y - 3) && helper g (x, y - 4))
    then
      let () = Player.update_position p (x, y) in
      let _ = Player.update_direction p Util.Up in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x + 1, y) && helper g (x + 2, y) &&
       helper g (x + 3, y) && helper g (x + 4, y))
    then
      let () = Player.update_position p (x, y) in
      let _ = Player.update_direction p Util.Right in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x - 1, y) && helper g (x - 2, y) &&
       helper g (x - 3, y) && helper g (x - 4, y))
    then
      let () = Player.update_position p (x, y) in
      let _ = Player.update_direction p Util.Left in
      { g with
        players = p::(g.players)
      }
    else
    add_player g p

let players g =
  g.players

let remove_player g i =
  { g with
    players = List.filter (fun p ->
        let () = (if Player.id p = 1 then Player.kill p) in
        Player.id p <> i) (players g)
  }

let to_json_update g =
  let l = [
    ("players", `List (List.map Player.to_json_update (players g)))
  ] in

  let l = match (g.food) with
  | Some x -> ("food", Util.json_of_cell x)::l
  | None -> l
  in

  `Assoc l

let to_json_initial g =
  let (cols, rows) = dimensions g in
  let l = [
    ("players", `List (List.map Player.to_json_initial (players g)));
    ("walls", `List (List.map (fun (z, _) -> Util.json_of_cell z) g.walls));
    ("dimensions", `Assoc [("rows", `Int rows); ("cols", `Int cols)])
  ] in

  let l = match (g.food) with
  | Some x -> ("food", Util.json_of_cell x)::l
  | None -> l
  in

  `Assoc l

let get_walls g =
  g.walls

let get_food g =
  g.food

let rec spawn_food g =
  (* Choose a random empty location to spawn food into *)
  if g.food = None then
  (
    let () = Random.self_init() in
    let x = Random.int (fst g.dimensions) in
    let y = Random.int (snd g.dimensions) in
    if (status_of_cell g (x, y) = Util.Empty) then g.food <- Some (x, y) else ()
    )

let players g =
  g.players

let player_with_id g id =
  try
    Some (List.find (fun x -> Player.id x = id) (players g))
  with
  | _ -> None

let prune_player g player =
  let advance_and_kill player = 
    if Player.is_alive player then 
      let () = Player.add_score player SCORES.tick in
      let () = Player.advance player in
      Player.kill player 
    else 
    ()
  in

  let pos = Util.add_cells (Player.position player)
            (Util.vector_of_direction (Player.direction player)) in

  let status = status_of_cell g pos in
  match status with
  | Util.Empty -> () (* all good, player can move here *)
  | Util.Food ->
    Player.eat_food player;
    Player.add_score player SCORES.food;
    g.food <- None
  | Util.Player x
  | Util.Trail x ->
    let p = Util.unwrap (player_with_id g x) in Player.add_score p SCORES.kill;
    advance_and_kill player
  | Util.Wall -> advance_and_kill player

let reset g =
  let new_g = { g with
    food = None;
    players = [];
  } in
  List.fold_left (fun a p ->
          if (Player.is_human p) then let () = Player.reset p in add_player a p
          else a) new_g (players g)

let act g =
  (* Check if the cell they want to move into is occupied *)
  List.iter (prune_player g) (players g);

  (* Advance all players *)
  List.iter (fun p -> if (Player.is_alive p) then 
            let () = Player.add_score p SCORES.tick in
            Player.advance p else ()) (players g);
