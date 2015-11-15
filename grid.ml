type cell_status = Player of string | Trail of string | Wall | Empty | Food
type cell = int * int

type t = {
    cells: (cell, cell_status) Hashtbl.t;
    dimensions: int * int;
    players: Player.t list;
}

let from_json_file path =
  failwith "Unimplemented"

let create dims =
  {
    players = [];
    cells = Hashtbl.create (((fst dims) / 2) * ((snd dims) / 2));
    dimensions = dims;
  }

let add_player g p =
  (* TODO: Set the player's position *)
  { g with
    players = p::(g.players)
  }

let status_of_cell g c =
  try
    Some (Hashtbl.find g.cells c)
  with
  | _ -> None

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
  | Some Empty -> () (* all good, player can move here *)
  | Some Food -> Player.eat_food player
  | _ -> Player.kill player

let act g =
  (* Advance all players *)
  List.iter Player.advance (players g);

  (* Check if the cell they want to move into is occupied *)
  List.iter (prune_player g) (players g);
