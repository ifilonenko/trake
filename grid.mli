(*  describes the current state of a cell
 * Player of x means that the cell is occupied by a player's actual vehicle
 * Trail of x means the cell is occupied by the trail of the player x
 * Wall means the cell is actually a wall and cannot be penetrated
 * Empty means there is nothing occupying the cell and it can be moved through
 * Food means there is food in that cell
*)
type cell_status = Player of string | Trail of string | Wall | Empty | Food
(*
  We will use an x, y coordinate system describing the positions of players, etc.
  The origin will be at the center of the board
*)
type cell = int * int


type rules = {
  trail_length: int;
  ticks_per_second: int;
  food_probability: float;
}

type t
type death_handler = t -> string -> unit

(* returns a unique identifier for this grid *)
val grid_id: t -> string

(* `grid_of_json path handler` will load a new Grid instance from the json file
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val grid_of_json: string -> death_handler -> t

(* `create (w, h) rules handler` will create a rectangular grid with the given rules
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val create: int * int -> rules -> death_handler -> t

(* `add_player grid p` will add player represneted by the given ID to the grid
 *)
val add_player: t -> string -> t

(* forcibly kills a player represented by the given id, useful if they disconnected or something *)
val kill_player: t -> string -> t

(* `cell_of_player grid i` will give the current location of
 * the player with id i in grid where i the player's id
 *)
val cell_of_player: t -> string -> cell option

(* `trail_of_player grid id` will return an optional list of cells
 * occupied by the given player's trail
 *)
val trail_of_player: t -> string -> (cell list) option

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

(* `act grid player dir` will return a new grid state in which all players have moved
 * in their current direction
 *)
val act: t -> t

(* `spawn_food grid` will spawn food somewhere random and return where it spawned
 * the likelihood of food actually spawning is dictated by the rules this Grid
 * was created with. It returns a tuple consisting of the new grid state and the location of the food
 *)
val spawn_food: t -> (t * cell option)

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
