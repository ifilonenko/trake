(* RGB color where each int is from 0-255 *)
type color = int * int * int

type t

(* Unique ID representing this player *)
val player_id: t -> int

(* Gives the given player's color  *)
val color: t -> color

(* JSON representation of this player as:
  {
     id: string
     color: { r: int; g: int; b: int }
  } *)
val json_of_player: t -> Yojson.Basic.json
