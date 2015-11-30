exception Invalid_Grid
type cell_status = Player of string | Trail of string | Wall | Empty | Food
type cell = int * int

type t = {
    walls: (cell * cell_status) list;
    food: cell option;
    dimensions: int * int;
    players: Player.t list;
}

let from_json_file path =
  failwith "Unimplemented"

(*Precondition: Dims must be at least 20x20 *)
let create dims =
  let (w, h) = dims in
  (* if (w < 20 || h < 20) then raise Invalid_Grid
  else  *)
    let rec gen_vert x y =
      if y > 0 then
        ((x, y), Wall)::(gen_vert x (y - 1))
      else
        []
    in
    let rec gen_horiz x y =
      if x > 0 then
        ((x, y), Wall)::(gen_horiz (x - 1) y)
      else
        []
  in

  {
    players = [];
    food = None;
    walls = (gen_vert 0 h) @ (gen_vert (w - 1) h) @ (gen_horiz w 0) @ (gen_horiz w (h - 1)) @ [((0, 0), Wall)];
    dimensions = dims;
  }

let status_of_cell g c =
  try
  (*TODO: Implement this*)
  let rec trail_helper players = 
    match players with 
    | h::t -> (let rec match_trail trl = 
                match trl with 
                | (x, y)::tl -> if ((fst c) = x && (snd c) = y) then Trail (Player.label h) else match_trail tl
                | [] -> trail_helper t 
              in
              match_trail (Player.tail h))
    | [] -> Empty
  in
  let rec player_helper players =
    match players with
    | h::t -> if ((fst c) = (fst (Player.position h)) && (snd c) = (snd (Player.position h))) then Player (Player.label h) else player_helper t
    | [] -> trail_helper g.players
  in
  let food_helper f =
    match f with 
    | Some (x, y) -> if ((fst c) = x && (snd c) = y) then Food else player_helper g.players
    | None -> player_helper g.players
  in
  let rec wall_helper lst =
    match lst with
    | ((x, y), cs)::t -> if ((fst c) = x && (snd c) = y) then cs else wall_helper t
    | [] -> food_helper g.food
  in
  wall_helper g.walls
  with
  | _ -> Wall

let helper g (x, y) =
  status_of_cell g (x, y) = Empty

let rec add_player g p =
  (* TODO: Set the player's position and direction*)
  let x = Random.int (fst g.dimensions) in
  let y = Random.int (snd g.dimensions) in
  if (status_of_cell g (x, y) <> Empty) then 
    add_player g p 
  else
    if (helper g (x, y + 1) && helper g (x, y + 2) &&
       helper g (x, y + 3) && helper g (x, y + 4))
    then 
      let () = Player.update_position p (x, y) in
      let () = Player.update_direction p Player.Down in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x, y - 1) && helper g (x, y - 2) &&
       helper g (x, y - 3) && helper g (x, y - 4))
    then 
      let () = Player.update_position p (x, y) in
      let () = Player.update_direction p Player.Up in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x + 1, y) && helper g (x + 2, y) &&
       helper g (x + 3, y) && helper g (x + 4, y))
    then 
      let () = Player.update_position p (x, y) in
      let () = Player.update_direction p Player.Right in
      { g with
        players = p::(g.players)
      }
    else
    if (helper g (x - 1, y) && helper g (x - 2, y) &&
       helper g (x - 3, y) && helper g (x - 4, y))
    then 
      let () = Player.update_position p (x, y) in
      let () = Player.update_direction p Player.Left in
      { g with
        players = p::(g.players)
      }
    else
    add_player g p

let dimensions g =
  g.dimensions

let to_json g =
  failwith "Unimplemented"

let spawn_food g =
  (* Choose a random empty location to spawn food into *)
  ()

let players g =
  g.players

let prune_player g player =
  let pos = Player.position player in
  let status = status_of_cell g pos in
  match status with
  | Empty -> () (* all good, player can move here *)
  | Food -> Player.eat_food player
  | _ -> Player.kill player

let act g =
  (* Advance all players *)
  List.iter Player.advance (players g);

  (* Check if the cell they want to move into is occupied *)
  List.iter (prune_player g) (players g);
