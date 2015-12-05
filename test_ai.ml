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

let new_grid = Grid.create (20,20)

let () = print_string "test creation of ai\n"
let ai = Player.create_ai 5 (1, 1, 1)
TEST_UNIT = Player.id ai === -4
TEST_UNIT = Player.is_human ai === false
TEST_UNIT = Player.is_ai ai === true
TEST_UNIT = Player.position ai === (1, 1)
TEST_UNIT = Player.direction ai === Util.Down
TEST_UNIT = Player.is_alive ai === true
TEST_UNIT = Player.label ai === "Robot 4"
TEST_UNIT = Player.color ai === (1, 1, 1)
TEST_UNIT = Player.tail_length ai === 5
TEST_UNIT = Player.tail ai === []

let () = print_string "test max_val\n"
let lst = [0; 5; 10; 20]
TEST_UNIT = Ai.max_val lst === 20

let () = print_string "test adding ai and updating ai fields\n"
let new_grid = Grid.add_player new_grid ai 
let () = Player.update_position ai (10, 10)
let _ = Player.update_direction ai Util.Right
TEST_UNIT = Player.position ai === (10, 10)
TEST_UNIT = Player.direction ai === Util.Right

let () = print_string "test index_list_of_maxes\n"
let l = Ai.index_list_of_maxes lst 0 20
TEST_UNIT = l === [3]
TEST_UNIT = Ai.index_list_of_maxes (20::lst) 0 20 === [0; 4]

let () = print_string "direction_list\n"
let directions = [Util.Up;Util.Down;Util.Left;Util.Right]
TEST_UNIT = Ai.direction_list l directions === [Util.Right]

let () = print_string "test sum_equal_lists\n"
TEST_UNIT = Ai.sum_equal_lists [0;5;10;20] [5;10;15;20] === [5;15;25;40]

let () = print_string "test food methods"
TEST_UNIT = Ai.food_exists new_grid === false
TEST_UNIT = Ai.do_djikstras_if_food_exists [10;10;10;10] ai new_grid === [10;10;10;10]

let () = print_string "100% passed\n"
