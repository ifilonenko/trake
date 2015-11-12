(* RGB color where each int is from 0-255 *)
type color = int * int * int

type player_status = Alive | Dead

(* Players can move in one of these directions *)
type direction = Up | Down | Left | Right

type t

(* creates a human player given a color and a label *)
val create_human: color -> string -> t

(* create_ai clr will create an AI player with the given color and label *)
val create_ai: color -> string -> t

(* Distinguishes between human or AI players *)
val is_human: t -> bool
val is_ai: t -> bool

(* direction the player is currently looking *)
val current_direction: t -> direction

(* Used for human players, when Game.t receives a message from this player to turn
 * it will call this function for the player instance
 *)
val set_current_direction: t -> direction -> unit

(* tells if the player is currently alive or dead *)
val current_status: t -> player_status
val set_current_status: t -> player_status -> unit

(* Unique ID representing this player *)
val id: t -> string

(* Human readable name for this player *)
val label: t -> string

(* Gives the given player's color  *)
val color: t -> color

(* Update should be called after ticks. It should update current_direction for the next tick
 * [update player grid diff] should either evaluate a new current_direction for AI or
 * send the given json to the player
 *)
val update: t -> Grid.t -> Yojson.Basic.json -> unit

(* JSON representation of this player as:
  {
     id: string
     color: { r: int; g: int; b: int }
  } *)
val json_of_player: t -> Yojson.Basic.json
