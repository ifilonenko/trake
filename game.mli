type t

(* creates a game instance given a domain/ip, port, and path to a grid json *)
val create: string -> int -> string -> t

(* TCP port this game is running on *)
val port: t -> int

(* ip or domain to access this game *)
val host: t -> string

(* starts this server *)
val start: t -> unit

(* Grid this game is being evaluated on *)
val grid: t -> Grid.t

(* Prompts players for next move, updates boards, evaluates kills *)
val tick: t -> t
