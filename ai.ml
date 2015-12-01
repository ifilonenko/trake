type direction = Up | Down | Left | Right

let max_val = function
    [] -> failwith "empty list"
  | x::xs -> List.fold_left max x xs

let rec index_list_of_maxes l index mv =
  match l with
  | [] -> []
  | h::t ->
    if (h=mv)
    then index::(index_list_of_maxes t (index+1) mv)
    else (index_list_of_maxes t (index+1) mv)

let rec direction_list l dl =
  match l with
  | [] -> []
  | h::t -> (List.nth dl h)::(direction_list t  dl)

let distance_list p g =
    let (ai_x, ai_y) = Player.position p in
    let (g_x,g_y) = Grid.dimensions g in
    let rec up_distance pos g =
      match (ai_x,pos) with
      | (ai_x, g_y) -> (g_y - pos)
      | _ ->
        let curr = (ai_x,pos) in
        match Grid.status_of_cell g curr with
        | Player _ -> (pos-ai_y)
        | Trail _ -> (pos-ai_y)
        | Wall -> (g_y - pos)
        | Empty -> up_distance (pos+1) g
        | Food -> (pos-ai_y) (* We are scared of food right now *)
        | _ -> failwith "you are not on the board"
    let rec down_distance pos g =
      match (ai_x,pos) with
      | (ai_x, -g_y) -> (pos - g_y)
      | _ ->
        let curr = (ai_x,pos) in
        match Grid.status_of_cell g curr with
        | Player _ -> (ai_y - pos)
        | Trail _ -> (ai_y - pos)
        | Wall -> (pos - g_y)
        | Empty -> down_distance (pos - 1) g
        | Food -> (ai_y - pos) (* We are scared of food right now *)
        | _ -> failwith "you are not on the board"
    let rec left_distance pos g =
      match (ai_x,pos) with
      | (-g_x, ai_y) -> (pos - g_x)
      | _ ->
        let curr = (pos, ai_y) in
        match Grid.status_of_cell g curr with
        | Player _ -> (ai_x - pos) e
        | Trail _ -> (ai_x - pos)
        | Wall -> (pos - g_x)
        | Empty -> left_distance (pos - 1) g
        | Food -> (ai_x - pos) (* We are scared of food right now *)
        | _ -> failwith "you are not on the board"
    let rec right_distance pos g =
      match (ai_x,pos) with
      | (g_x, ai_y) -> (g_x - pos)
      | _ ->
        let curr = (pos, ai_y) in
        match Grid.status_of_cell g curr with
        | Player _ -> (pos-ai_x)
        | Trail _ -> (pos-ai_x)
        | Wall -> (g_x - pos)
        | Empty -> right_distance (pos+1) g
        | Food -> (pos-ai_x) (* We are scared of food right now *)
        | _ -> failwith "you are not on the board"
    [(up_distance ai_y);(down_distance ai_y);
    (left_distance ai_x);(right_distance ai_x);]

(* Update direction of player *)
let new_direction p g =
  let distances = distance_list p g in
  let directions = [Up;Down;Left;Right] in
  let max_indexes = distances 0 (max_val distances) in
  (* For ties, naive solution will just take the first one *)
  let best_direction = List.nth (direction_list max_indexes directions) 0 in
  best_direction

