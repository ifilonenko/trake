(* RGB color where each int is from 0-255 *)
type color = int * int * int

(* Players can move in one of these directions *)
type direction = Up | Down | Left | Right

type t

(* creates a human player given an id, trail length, a color and a label *)
val create_human: int -> int -> color -> string -> t

val id: t -> int

(* create_ai id clr will create an AI player with the given color and label *)
val create_ai: int -> int -> color -> string -> t

(* Distinguishes between human or AI players *)
val is_human: t -> bool
val is_ai: t -> bool

(* direction the player is currently looking *)
val direction: t -> direction

(* Used for human players, when Game.t receives a message from this player to turn
 * it will call this function for the player instance
 *)
val update_direction: t -> direction -> unit

(* tells if the player is currently alive or dead *)
val is_alive: t -> bool
val kill: t -> unit

(* Human readable name for this player *)
val label: t -> string

(* Gives the given player's color  *)
val color: t -> color

(* JSON representation of this player as:
  {
     id: string
     color: { r: int; g: int; b: int }
     position: [ int, int ]
     tail: [ [int, int], [int, int], ...]
  } *)
val to_json: t -> Yojson.Basic.json

val tail_length: t -> int
val tail: t -> (int * int) list
val eat_food: t -> unit
val position: t -> int * int
val advance: t -> unit
val occupies_cell: t -> int * int -> bool
