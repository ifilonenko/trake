type t
(* Amount of times per second that the board state is updated *)
val ticks_per_second: t -> int

(* Grid this game is being evaluated on *)
val grid: t -> Grid.t

(* TCP port this game is running on *)
val port: t -> int

(* Web address to access this game *)
val address: t -> string

(* Prompts players for next move, updates boards, evaluates kills *)
val tick: t -> t
