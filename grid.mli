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

type t

(* `grid_of_json path handler` will load a new Grid instance from the json file
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val from_json_file: string -> t

(* `create (w, h) handler` will create a rectangular grid
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val create: int * int -> t

(* `add_player grid p` will add player represneted by the given ID to the grid
 *)
val add_player: t -> Player.t -> t

(* Gives occupation status of the given cell *)
val status_of_cell: t -> cell -> cell_status option

(* Gives maximum width and height of the grid,
 * though it may not be a perfect quadrilateral
 *)
val dimensions: t -> int * int

(* `spawn_food grid` will spawn food somewhere random and return where it spawned *)
val spawn_food: t -> unit

val act: t -> unit

(* Returns a JSON representation of this grid with all of its cells, dimensions, and rules
 * Format:
 *   cells: same as `Grid.cells` with cells serialized using the Yojson.Safe method
 *   dimensions: { width: int; height: int }
 *   players: dictionary of player info with the keys being their ID's and the cells they own
 *)
val to_json: t -> Yojson.Basic.json

(* All the players in this game *)
val players: t -> Player.t list
