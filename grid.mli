exception Invalid_Grid

type t

(* `grid_of_json path handler` will load a new Grid instance from the json file
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val from_json_file: string -> t

(* Precondition: dimensions need to be at least 20x20
 * `create (w, h) handler` will create a rectangular grid
 * handler is a function that takes a grid and player id. It will be called
 * every time a player dies
 *)
val create: int * int -> t

(* Gives occupation status of the given cell *)
val status_of_cell: t -> int * int -> Util.cell_status

(* `add_player grid p` will add the given player represented by an ID to the grid
 * in a random position generated using our formula
 *)
val add_player: t -> Player.t -> t

(* Gives maximum width and height of the grid,
 * though it may not be a perfect quadrilateral
 *)
val dimensions: t -> int * int

(* Returns a JSON representation of this grid with all of its cells, dimensions, and rules
 * Format:
 *   cells: same as `Grid.cells` with cells serialized using the Yojson.Safe method
 *   dimensions: { width: int; height: int }
 *   players: dictionary of player info with the keys being their ID's and the cells they own
 *)
val to_json: t -> Yojson.Basic.json

(* `spawn_food grid` will spawn food somewhere random and return where it spawned *)
val spawn_food: t -> unit

(* All the players in this game *)
val players: t -> Player.t list

(* Returns Some x, where x is the player in this game with the given id, None if not found *)
val player_with_id: t -> int -> Player.t option

(* Determines what should happen to the player based on the player's current position *)
val prune_player: t -> Player.t -> unit

(* Advances all the players and determines what should happent o the player
 * based on what the player decided to do
 *)
val act: t -> unit
