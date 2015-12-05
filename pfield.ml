let add_to_hash hash pos pid pot =
  Hashtbl.add hash pos ((pid,pot)::(Hashtbl.find hash pos))

let check_and_add_if_true hash pos pid pot =
  if Hashtbl.mem hash pos
  then add_to_hash hash pos pid pot
  else ()

let add_potentials_to_hash grid_scale p hash =
  let () = print_string "entered\n" in
  let pid = Player.id p in
  let (ai_x, ai_y) = Player.position p in
  let tail = Player.tail p in
  (* Heads should be labeled as -grid_scale *)
  let () = add_to_hash hash (ai_x,ai_y) pid (-grid_scale) in
  (* Possible directions should be same *)
  let () =
      (* Up *)
     check_and_add_if_true hash (ai_x,ai_y+1) pid (-grid_scale);
     (* Down *)
     check_and_add_if_true hash (ai_x,ai_y-1) pid (-grid_scale);
     (* Left *)
     check_and_add_if_true hash (ai_x-1,ai_y) pid (-grid_scale);
     (* Right *)
     check_and_add_if_true hash (ai_x+1,ai_y) pid (-grid_scale); in
  (* Same with tails *)
  if (List.length tail > 0)
  then
    let () = List.nth (
      List.map (fun pos -> add_to_hash hash pos pid (-grid_scale)) tail
    ) 0 in
  let () = List.nth (
    List.map (fun pos ->
      let (x,y) = pos in
      (* Up 1 *)
      let () = check_and_add_if_true hash (x,y+1) pid (-(grid_scale/4)) in
      (* Up 2 *)
      let () = check_and_add_if_true hash (x,y+2) pid ((grid_scale/4)) in
      (* Down 1 *)
      let () = check_and_add_if_true hash (x,y-1) pid (-(grid_scale/4)) in
      (* Down 2 *)
      let () = check_and_add_if_true hash (x,y-2) pid ((grid_scale/4)) in
      (* Left 1 *)
      let () = check_and_add_if_true hash (x-1,y) pid (-(grid_scale/4)) in
      (* Left 2 *)
      let () = check_and_add_if_true hash (x-2,y) pid ((grid_scale/4)) in
      (* Right 1 *)
      let () = check_and_add_if_true hash (x+1,y) pid (-(grid_scale/4)) in
      (* Right 2 *)
      let () = check_and_add_if_true hash (x+2,y) pid ((grid_scale/4)) in
      ()
     ) ((ai_x,ai_y)::tail)
  ) 0 in
  ()

let create g =
  let (pg_x,pg_y) = Grid.dimensions g in
  let grid_scale = max pg_x pg_y in
  let (g_x, g_y) = (pg_x-1,pg_y-1) in
  let hash = Hashtbl.create (pg_x * pg_y) in
  let (x,y) = (ref 0,ref 0) in
  while ((!y) <> (g_y+1)) do
    while ((!x) <> g_x) do
      Hashtbl.add hash (!x,!y) [(-1000,0)];x:=(!x)+1;
    done;
    y:=(!y)+1;Hashtbl.add hash (!x,!y) [(-1000,0)];x:=0;
  done;
  let players = Grid.players g in
  if (List.length players > 0)
  then
    let () = List.nth (
      List.map (fun p -> add_potentials_to_hash grid_scale p hash) players
    ) 0 in
    hash
  else hash

let rec sum_non_player_pots sum pid plist =
    match plist with
    | [] -> sum
    | h::t ->
      if (fst h = pid)
      then sum_non_player_pots sum pid t
      else (snd h)+ (sum_non_player_pots sum pid t)

let account_for_self_destruct grid_scale pos p hash =
  let tail = Player.tail p in
  if (List.length tail > 0)
  then
    if List.mem pos tail
    then
      let () = add_to_hash hash pos (-1001) (-(grid_scale*10)) in
      hash
    else hash
  else hash

let rec self_destruct_loop gs lst p hash =
  match lst with
  | [] -> hash
  | h::t -> self_destruct_loop gs t p (account_for_self_destruct gs h p hash)

let direction_potentials p g hash =
  let (ai_x, ai_y) = Player.position p in
  let (pg_x,pg_y) = Grid.dimensions g in
  let grid_scale = max pg_x pg_y in
  let pid = Player.id p in
  (* Up *)
  let u_cord = (ai_x, ai_y+1) in
  (* Down *)
  let d_cord = (ai_x, ai_y-1) in
  (* Left *)
  let l_cord = (ai_x-1, ai_y) in
  (* Right *)
  let r_cord = (ai_x+1, ai_y) in
  (* Account for running into tail *)
  let coord_list = [u_cord;d_cord;l_cord;r_cord] in
  let updated_hash = self_destruct_loop grid_scale coord_list p hash in
  List.map (
    fun coord ->
      sum_non_player_pots 0 pid (Hashtbl.find updated_hash coord)
  ) coord_list



