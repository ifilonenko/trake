(* Allow server instances so we can run multiple servers on different ports *)
type t

val games: t -> Game.t list

(* TCP port this game is running on *)
val port: t -> int

(* Web address to access this game *)
val address: t -> string

(* starts this server *)
val start: unit -> unit
