(* RGB color where each int is from 0-255 *)
type color = int * int * int

type t

(* creates a human player given an id, trail length, a color and a label *)
val create_human: int -> int -> color -> string -> t

(* create_ai clr will create an AI player with the given color and label *)
val create_ai: int -> color -> t

val id: t -> int

(*  Distinguishes between human or AI players *)
val is_human: t -> bool
val is_ai: t -> bool

(* direction the player is currently looking *)
val direction: t -> Util.direction

(* Used for human players, when Game.t receives a message from this player to turn
 * it will call this function for the player instance
 *)
val update_direction: t -> Util.direction -> bool

(* Used for human players, when Game.t receives the command to start the game it
 * updates the position of the player
 *)
val update_position: t -> int * int -> unit

(* tells if the player is currently alive or dead *)
val is_alive: t -> bool
val kill: t -> unit
val reanimate: t -> unit

(* Human readable name for this player *)
val label: t -> string

(* Gives the given player's color  *)
val color: t -> color

val score: t -> int
val add_score: t -> int -> unit

(* JSON representation of this player as:
  {
     id: string
     color: { r: int; g: int; b: int }
     position: [ int, int ]
     tail: [ [int, int], [int, int], ...]
  } *)
val to_json_initial: t -> Yojson.Basic.json
val to_json_update: t -> Yojson.Basic.json

val tail_length: t -> int
val eat_food: t -> unit
val position: t -> int * int
val tail: t -> (int * int) list

(* Determines if the player occupies the given cell *)
val occupies_cell: t -> int * int -> bool

(* Calculates the new position and updates the player to advance to that
 * new position and it readjusts the tail *)
val advance: t -> unit

val reset: t -> unit
