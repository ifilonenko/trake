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
    let (pg_x,pg_y) = Grid.dimensions g in
    let (g_x, g_y) = (pg_x-1,pg_y-1) in
    let rec up_distance pos g =
      match (ai_x,pos) with
      | _ ->
        let curr = (ai_x,pos) in
        match Grid.status_of_cell g curr with
        | Util.Player _ -> (pos-ai_y)
        | Util.Trail _ -> (pos-ai_y)
        | Util.Wall -> (g_y - ai_y)
        | Util.Empty -> up_distance (pos+1) g
        | Util.Food -> (pos-ai_y) (* We are scared of food right now *) in
    let rec down_distance pos g =
      match (ai_x,pos) with
      | _ ->
        let curr = (ai_x,pos) in
        match Grid.status_of_cell g curr with
        | Util.Player _ -> (ai_y - pos)
        | Util.Trail _ -> (ai_y - pos)
        | Util.Wall -> (ai_y)
        | Util.Empty -> down_distance (pos - 1) g
        | Util.Food -> (ai_y - pos) (* We are scared of food right now *) in
    let rec left_distance pos g =
      match (ai_x,pos) with
      | _ ->
        let curr = (pos, ai_y) in
        match Grid.status_of_cell g curr with
        | Util.Player _ -> (ai_x - pos)
        | Util.Trail _ -> (ai_x - pos)
        | Util.Wall -> (ai_x)
        | Util.Empty -> left_distance (pos - 1) g
        | Util.Food -> (ai_x - pos) (* We are scared of food right now *) in
    let rec right_distance pos g =
      match (ai_x,pos) with
      | _ ->
        let curr = (pos, ai_y) in
        match Grid.status_of_cell g curr with
        | Player _ -> (pos-ai_x)
        | Trail _ -> (pos-ai_x)
        | Wall -> (g_x - ai_x)
        | Empty -> right_distance (pos+1) g
        | Food -> (pos-ai_x) (* We are scared of food right now *) in
    [(up_distance ai_y g);(down_distance ai_y g);
    (left_distance ai_x g);(right_distance ai_x g);]

let new_direction p g =
  let distances = distance_list p g in
  let directions = [Util.Up;Util.Down;Util.Left;Util.Right] in
  let max_indexes = (index_list_of_maxes distances 0 (max_val distances)) in
  (* For ties, naive solution will just take the first one *)
  let best_direction = List.nth (direction_list max_indexes directions) 0 in
  let () = Player.update_direction (p) (best_direction) in
  ()

