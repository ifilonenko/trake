(*  describes the current state of a cell
 * Player of x means that the cell is occupied by a player's actual vehicle
 * Trail of x means the cell is occupied by the trail of the player x
 * Wall means the cell is actually a wall and cannot be penetrated
 * Empty means there is nothing occupying the cell and it can be moved through
 * Food means there is food in that cell
*)
type cell_status = Player of Player.t | Trail of player.t | Wall | Empty | Food
(*
  We will use an x, y coordinate system describing the positions of players, etc.
  The origin will be at the center of the board
*)
type cell = int * int

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

(* All the players on this board *)
val players: t -> Player.t list
