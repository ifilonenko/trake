type t

(* unique identifier for this game *)
val game_uuid: t -> string

(* Grid this game is being evaluated on *)
val grid: t -> Grid.t

(* Prompts players for next move, updates boards, evaluates kills *)
val tick: t -> t
