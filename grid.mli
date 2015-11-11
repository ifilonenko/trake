(*  describes the current state of a cell
 * Player of x means that the cell is occupied by a player's actual vehicle
 * Trail of x means the cell is occupied by the trail of the player x
 * Wall means the cell is actually a wall and cannot be penetrated
 * Empty means there is nothing occupying the cell and it can be moved through
 * Food means there is food in that cell
*)
type cell_status = Player of Player.t | Trail of Player.t | Wall | Empty | Food
(*
  We will use an x, y coordinate system describing the positions of players, etc.
  The origin will be at the center of the board
*)
type cell = int * int

type rules = {
  trail_length: int;
  ticks_per_second: int;
}

(* Players can move in one of these directions *)
type direction = Up | Down | Left | Right

type t

(* cell_of_player grid i will give the current location of
 * the player at index i in grid where i is the index of the player in the players array
 *)
val cell_of_player: t -> int -> cell

(* Gives occupation status of the given cell *)
val status_of_cell: t -> cell -> cell_status

(* Gives maximum width and height of the grid,
 * though it may not be a perfect quadrilateral
 *)
val dimensions: t -> int * int

(* cells grid will return a row-major list of cell_status lists
 * in which each list in the top level list represents a row
 *
 *)
val cells: t -> (cell_status list) list

(* Amount of times per second that the board state is updated *)
val rules: t -> rules

(* All the players on this board *)
val players: t -> Player.t list

(* act grid player dir will return a tuple with new grid state in which the player `player`
 * has moved in the direction `dir` and also a JSON representation of the changes made
 *)
val act: t -> int -> direction -> t * Yojson.Basic.json

(* spawn_food grid will return a new grid state with food spawned in a random location
 *
 *)
val spawn_food: t -> t

(* Returns a JSON representation of this grid with all of its cells, dimensions, and rules
 * Format:
 *   rules: dictionary of rules type from this grid
 *   grid: same as `Grid.cells` with cells serialized using `Grid.string_of_cell_status`
 *   dimensions: { width: int; height: int }
 *   players: array of players serialized with `Player.json_of_player`
 *)
val json_of_grid: t -> Yojson.Basic.json

(* formatted cell status as a string *)
val string_of_cell_status: cell_status -> Yojson.Basic.json
