module Queue = struct
  type 'a t = ('a list * 'a list) ref
  exception Empty
  let create () = ref ([], [])

  let enqueue x queue =
    let front, back = !queue in
        queue := (x::front, back)

  let rec dequeue queue =
    match !queue with
        | (front, x :: back) -> queue := (front, back);x
        | ([], []) -> raise Empty
        | (front, []) -> queue := ([], List.rev front); dequeue queue
  let is_empty queue =
    match !queue with
        | ([],[]) -> true
        | _ -> false
end

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
  | h::t -> (List.nth dl h)::(direction_list t dl)

let distance_list p g =
    let (ai_x, ai_y) = Player.position p in
    let (pg_x,pg_y) = Grid.dimensions g in
    let (g_x, g_y) = (pg_x-1,pg_y-1) in
    let rec up_distance pos g =
      let curr = (ai_x,pos) in
      match Grid.status_of_cell g curr with
      | Util.Player _ -> (pos-ai_y)
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
    [(up_distance ai_y g);(down_distance ai_y g);
    (left_distance ai_x g);(right_distance ai_x g);]

let shortest_food_finder p g =
  (* let q = Queue.create () in *)
  (* For now just check player position *)
(*   let (ai_x, ai_y) = Player.position p in
  let (pg_x,pg_y) = Grid.dimensions g in
  let (g_x, g_y) = (pg_x-1,pg_y-1) in
  let distance_hash = Hashtbl.create (pg_x * pg_y) in
  let backpointer_hash = Hashtbl.create (pg_x * pg_y) in
  let () = Queue.enqueue (ai_x, ai_y) q;Hashtbl.add distance_hash (ai_x, ai_y) 0
  ;Hashtbl.add backpointer_hash (ai_x, ai_y) (ai_x, ai_y) in
  let quit_loop = ref false in
  while ((is_empty q)==false || ) do
    let index = Queue.dequeue q in
    match
  done *)
  [0;0;0;0]

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
  match Grid.get_food g with
  | None -> false
  | Some _ -> true

let do_djikstras_if_food_exists lst p g =
  if food_exists g
  (* Need to implement djikstras here *)
  then sum_equal_lists lst (shortest_food_finder p g)
  else sum_equal_lists lst [0;0;0;0]

let new_direction p g =
  let distances = distance_list p g in
  let () = print_int_list distances in
  let () = print_string "hello\n" in
  let potential_field_hash = Pfield.create g in
  let () = print_string "successful" in
  let potential_values = Pfield.direction_potentials p g potential_field_hash in
  let () = print_int_list potential_values in
  let maximums = sum_equal_lists distances potential_values in
  let () = print_int_list maximums in
  let new_maximums = do_djikstras_if_food_exists maximums p g in
  let directions = [Util.Up;Util.Down;Util.Left;Util.Right] in
  let max_indexes = (index_list_of_maxes new_maximums 0 (max_val new_maximums)) in
  let best_direction = List.nth (direction_list max_indexes directions) 0 in
  let () = Player.update_direction (p) (best_direction) in
  ()