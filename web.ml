(* Collection of utilities for use with web communication *)

type action = Join of (string * Player.color) | Turn of Player.direction
