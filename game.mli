(* Game is in charge of managing the incoming and outgoing connections of the game server
 * and creating players when they are added, or removing them if not
 * It is also responsible for managing ticks, to coordinate movement
 *)
type t

(* creates a game instance given a domain/ip, port, and a grid *)
val create: string -> int -> Grid.t -> t
val create_from_json: string -> int -> string -> Grid.death_handler -> t

(* TCP port this game is running on *)
val port: t -> int

(* ip or domain to access this game *)
val host: t -> string

(* starts this server *)
val start: t -> unit

(* Grid this game is being evaluated on *)
val grid: t -> Grid.t

(* Prompts players for next move, updates boards, evaluates kills, etc *)
val tick: t -> t

(* All the players in this game *)
val players: t -> Player.t list
