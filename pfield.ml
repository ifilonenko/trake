let add_to_hash hash pos pid pot =
  Hashtbl.add hash pos ((pid,pot)::(Hashtbl.find hash pos))

let check_and_add_if_true hash pos pid pot =
  if Hashtbl.mem hash pos
  then add_to_hash hash pos pid pot
  else ()

let add_potentials_to_hash p hash =
  let pid = Player.id p in
  let (ai_x, ai_y) = Player.position p in
  let tail = Player.tail p in
  (* Heads should be labeled as -20 *)
  let () = add_to_hash hash (ai_x,ai_y) pid (-20) in
  (* Possible directions should be same *)
  let () =
      (* Up *)
     check_and_add_if_true hash (ai_x,ai_y+1) pid (-20);
     (* Down *)
     check_and_add_if_true hash (ai_x,ai_y-1) pid (-20);
     (* Left *)
     check_and_add_if_true hash (ai_x-1,ai_y) pid (-20);
     (* Right *)
     check_and_add_if_true hash (ai_x+1,ai_y) pid (-20); in
  (* Same with tails *)
  let () = List.nth (
    List.map (fun pos -> add_to_hash hash pos pid (-20)) tail
  ) 0 in
  let () = List.nth (
    List.map (fun pos ->
      let (x,y) = pos in
      (* Up 1 *)
      let () = check_and_add_if_true hash (x,y+1) pid (-5) in
      (* Up 2 *)
      let () = check_and_add_if_true hash (x,y+2) pid (5) in
      (* Down 1 *)
      let () = check_and_add_if_true hash (x,y-1) pid (-5) in
      (* Down 2 *)
      let () = check_and_add_if_true hash (x,y-2) pid (5) in
      (* Left 1 *)
      let () = check_and_add_if_true hash (x-1,y) pid (-5) in
      (* Left 2 *)
      let () = check_and_add_if_true hash (x-2,y) pid (5) in
      (* Right 1 *)
      let () = check_and_add_if_true hash (x+1,y) pid (-5) in
      (* Right 2 *)
      let () = check_and_add_if_true hash (x+2,y) pid (5) in
      ()
     ) ((ai_x,ai_y)::tail)
  ) 0 in
  ()

let create g =
  let (pg_x,pg_y) = Grid.dimensions g in
  let (g_x, g_y) = (pg_x-1,pg_y-1) in
  let hash = Hashtbl.create (pg_x * pg_y) in
  let (x,y) = (ref 0,ref 0) in
  while ((!y) <> (g_y+1)) do
    while ((!x) <> g_x) do
      Hashtbl.add hash (!x,!y) [(-1,0)];print_int (!x);print_string ", ";print_int (!y);print_string "\n";x:=(!x)+1;
    done;
    print_int (!x);print_string ", ";print_int (!y);print_string "\n";y:=(!y)+1;Hashtbl.add hash (!x,!y) [(-1,0)];x:=0;
  done;
  let () = print_string "created\n" in
  let players = Grid.players g in
  let () = print_int (List.length players);print_string "\n" in
  if (List.length players > 0)
  then
    let () = List.nth (
      List.map (fun p -> add_potentials_to_hash p hash) players
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
let direction_potentials p g hash =
  let (ai_x, ai_y) = Player.position p in
  let pid = Player.id p in
  (* Up *)
  let u_cord = (ai_x, ai_y+1) in
  (* Down *)
  let d_cord = (ai_x, ai_y-1) in
  (* Left *)
  let l_cord = (ai_x-1, ai_y) in
  (* Right *)
  let r_cord = (ai_x+1, ai_y) in
  List.map (
    fun coord ->
      sum_non_player_pots 0 pid (Hashtbl.find hash coord)
  ) [u_cord;d_cord;l_cord;r_cord]



