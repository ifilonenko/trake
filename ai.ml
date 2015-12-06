let max_val = function
  | [] -> failwith "empty list"
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
  | h::t -> (List.nth dl h)::(direction_list t dl)

let distance_list p g =
    let (ai_x, ai_y) = Player.position p in
    let (pg_x,pg_y) = Grid.dimensions g in
    let (g_x, g_y) = (pg_x-1,pg_y-1) in
    let rec up_distance pos g =
      let curr = (ai_x,pos) in
      match Grid.status_of_cell g curr with
      | Util.Player _ ->(pos-ai_y)
      | Util.Trail _ -> (pos-ai_y)
      | Util.Wall -> (g_y - ai_y)
      | Util.Empty -> up_distance (pos+1) g
      | Util.Food -> up_distance (pos+1) g (* We like food *) in
    let rec down_distance pos g =
      let curr = (ai_x,pos) in
      match Grid.status_of_cell g curr with
      | Util.Player _ -> (ai_y - pos)
      | Util.Trail _ -> (ai_y - pos)
      | Util.Wall -> (ai_y)
      | Util.Empty -> down_distance (pos - 1) g
      | Util.Food -> down_distance (pos - 1) g (* We like food *) in
    let rec left_distance pos g =
      let curr = (pos, ai_y) in
      match Grid.status_of_cell g curr with
      | Util.Player _ -> (ai_x - pos)
      | Util.Trail _ -> (ai_x - pos)
      | Util.Wall -> (ai_x)
      | Util.Empty -> left_distance (pos - 1) g
      | Util.Food -> left_distance (pos - 1) g (* We like food *) in
    let rec right_distance pos g =
      let curr = (pos, ai_y) in
      match Grid.status_of_cell g curr with
      | Util.Player _ -> (pos-ai_x)
      | Util.Trail _ -> (pos-ai_x)
      | Util.Wall -> (g_x - ai_x)
      | Util.Empty -> right_distance (pos+1) g
      | Util.Food -> right_distance (pos+1) g (* We like food *) in
    [(up_distance (ai_y+1) g);(down_distance (ai_y-1) g);
    (left_distance (ai_x-1) g);(right_distance (ai_x+1) g);]

let manhattan_distance pos1 pos2 =
  (abs ((fst pos1)-(fst pos2))) + (abs ((snd pos1)-(snd pos2)))


let shortest_food_finder p g =
  (* Djikstras doesn't make sense here because its too much computation per tick *)
  (* Instead just take manhattan distance *)
  let (ai_x, ai_y) = Player.position p in
  let (pg_x,pg_y) = Grid.dimensions g in
  let grid_scale = max pg_x pg_y in
  match (Grid.get_food g) with
    | Some pos ->
      let food_loc = (Util.cell_to_tuple pos) in
      let up_v = manhattan_distance food_loc (ai_x,ai_y+1) in
      let d_v = manhattan_distance food_loc (ai_x,ai_y-1) in
      let l_v = manhattan_distance food_loc (ai_x+1,ai_y) in
      let r_v = manhattan_distance food_loc (ai_x-1,ai_y) in
      (* By scaling by grid_scale this makes the AI a little dumber, which
         makes the game playable *)
      [(-up_v)*(grid_scale/4);(-d_v)*(grid_scale/4);(-l_v)*(grid_scale/4);
      (-r_v)*grid_scale/4]
    | None ->   [0;0;0;0]

let rec sum_equal_lists l1 l2 =
  match (l1,l2) with
  | (a::b,c::d) -> (a+c)::(sum_equal_lists b d)
  | _ -> []

let rec print_int_list input_list =
  match input_list with
  | [] -> ()
  | h::t ->
    print_int h;print_string "\n";print_int_list t

let food_exists g =
  match (Grid.get_food g) with
  | None -> false
  | Some _ -> true

let do_djikstras_if_food_exists lst p g =
  if food_exists g
  then sum_equal_lists lst (shortest_food_finder p g)
  else sum_equal_lists lst [0;0;0;0]

let new_direction p g =
  (* First calculate distance ot dangers *)
  let distances = distance_list p g in
  let potential_field_hash = Pfield.create g in
  (* Next calculate the potentials at each of the direction coordinates *)
  let potential_values = Pfield.direction_potentials p g potential_field_hash in
  let maximums = sum_equal_lists distances potential_values in
  (* Lastly calculate distance to food *)
  (* Objective function = [danger_distance + potential + (-food_distance) ]
     and our goal is to maximize this objective function and return the direction
  *)
  let new_maximums = do_djikstras_if_food_exists maximums p g in
  let directions = [Util.Down;Util.Up;Util.Left;Util.Right] in
  let max_indexes = (index_list_of_maxes new_maximums 0 (max_val new_maximums)) in
  (* Just in case there is a tie (which there wont in most cases) return first *)
  let best_direction = List.nth (direction_list max_indexes directions) 0 in
  let _ = Player.update_direction (p) (best_direction) in
  ()
