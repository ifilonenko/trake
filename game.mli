(* Game is in charge of managing the incoming and outgoing connections of the game server
 * and creating players when they are added, or removing them if not
 * It is also responsible for managing ticks, to coordinate movement
 *)
type t
type rules = {
  trail_length: int;
  ticks_per_second: float;
  food_probability: float;
}

(* creates a game instance given a domain/ip, port, and a grid *)
val create: string -> int -> Grid.t -> rules -> t
val create_from_json: string -> int -> string -> rules -> t

(* TCP port this game is running on *)
val port: t -> int

(* ip or domain to access this game *)
val host: t -> string

(* starts this server *)
val start: t -> unit Lwt.t

(* Grid this game is being evaluated on *)
val grid: t -> Grid.t

(* Prompts players for next move, updates boards, evaluates kills, etc *)
val tick: t -> unit -> unit Lwt.t

(* Game rules *)
val rules: t -> rules
