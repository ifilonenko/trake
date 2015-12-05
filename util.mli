(*  describes the current state of a cell
 * Player of x means that the cell is occupied by a player's actual vehicle
 * Trail of x means the cell is occupied by the trail of the player x
 * Wall means the cell is actually a wall and cannot be penetrated
 * Empty means there is nothing occupying the cell and it can be moved through
 * Food means there is food in that cell
*)
type cell_status = Player of int | Trail of int | Wall | Empty | Food
(*
  We will use an x, y coordinate system describing the positions of players, etc.
  The origin will be at the center of the board
*)
type cell = int * int

(* Directions the players can move in *)
type direction = Up | Down | Left | Right

(* Applies vector addition to two given cells *)
val add_cells: int * int -> int * int -> int * int

(* Returns the vector direction of the direction given *)
val vector_of_direction: direction -> int * int

val direction_of_string: string -> direction
val string_of_direction: direction -> string

val json_of_cell: cell -> Yojson.Basic.json
val cell_of_json: Yojson.Basic.json -> cell

val cell_to_tuple : cell -> int * int
