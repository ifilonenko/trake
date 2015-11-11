(* RGB color where each int is from 0-255 *)
type color = int * int * int

(* Players can move in one of these directions *)
type direction = Up | Down | Left | Right

type t

(* TODO: Figure out which function to take for create_human to process input *)
val create_human: color -> t

(* create_ai clr will create an AI player with the given color *)
val create_ai: color -> t

val is_human: t -> bool
val is_ai: t -> bool

val current_direction: t -> direction

(* Used for human players, when Game.t receives a message from this player to turn
 * it will call this function for the player instance
 *)
val set_current_direction: t -> direction -> unit

(* Unique ID representing this player *)
val player_id: t -> string

(* Gives the given player's color  *)
val color: t -> color

(* JSON representation of this player as:
  {
     id: string
     color: { r: int; g: int; b: int }
  } *)
val json_of_player: t -> Yojson.Basic.json
