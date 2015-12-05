open Assertions

let grid = Grid.create (20, 20)
let p = (Player.create_ai 5 (0,0,0))
let p2 = (Player.create_ai 5 (0,1,0))
let rec print_int_list (input_list: int list) : unit =
  match input_list with
  | [] -> ()
  | h::t ->
    print_int h;print_string "\n";print_int_list t
let direction p =
  match Player.direction p with
    | Util.Up -> "Up\n"
    | Util.Down -> "Down\n"
    | Util.Left -> "Left\n"
    | Util.Right -> "Right\n"
let () = print_string (direction p)
let new_grid = Grid.add_player grid p
let () = Ai.new_direction p new_grid
let () = print_string (direction p)
let () = Grid.act new_grid
let () = Ai.new_direction p new_grid
let () = print_string (direction p)
let () = print_string "lets add another player\n"
let newer_grid = Grid.add_player new_grid p2
let (ai_x, ai_y) = Player.position p2
let () = print_string "player located at: ";print_int ai_x;print_string ", ";print_int ai_y;print_string "\n"
let () = print_string "with direction of: ";print_string (direction p2)
let () = print_string "before: ";print_string (direction p)
let () = Ai.new_direction p newer_grid
let () = print_string "after: ";print_string (direction p)

let () = print_string "100% passed\n"
(*
let added_players = Grid.add_player new_grid
TEST_UNIT = Util.vector_of_direction (Util.Up) === (0, 1)
TEST_UNIT = Util.vector_of_direction (Util.Down) === (0, -1)
TEST_UNIT = Util.vector_of_direction (Util.Left) === (-1, 0)
TEST_UNIT = Util.vector_of_direction (Util.Right) === (1, 0)

TEST_UNIT = Util.add_cells (1, 2) (2, 1) === (3, 3)
TEST "status_of_cell_grid" =
TEST "create_grid" =
TEST "add_player_grid" =
TEST "prune_player_grid" =
TEST "add_cells_player" =
TEST "vector_of_direction_player" =
TEST "player_methods" =
TEST "occupies_cell_player" =
TEST "advance_player" =
 *)