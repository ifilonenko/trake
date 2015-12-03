(* potential field is in charge of creating levels of threats and interest
 * for certain distances away from the head + tail. The pfield is broken up as
 * a hash that maps an index to a corresponding score
 *)
(* Graphical Representation of a PFiel*)


(* ____________________________
  | 0    0   0   0   0   0  0 |
  | 0    0   0   0   5   0  0 |
  | 0    0   0    0  -20 0  0 |
  | 0    0   0   -20 o  -20 0 |
  | 0    0   0   -5  |  -5  0 |
  | 0    5   5   -5  |  -5  0 |
  | 0   -5   0   5  -5 -5   0 |
  | -5   |   -5  5  5  0    0 |
  | -5   |   -5  5  0  0    0 |
  |-20   o  -20  5  0  0    0 |
  |_0___-20___0__0__0__0____0_|

o-- is tha snake the numbers are the following potentials

*)



(* This function adds a value to a given key (which is a coordinate) *)
val add_to_hash : ('a, ('b * 'c) list) Hashtbl.t -> 'a -> 'b -> 'c -> unit

(* This function first checks if it is a valid coordinate then adds to has *)
val check_and_add_if_true : ('a, ('b * 'c) list) Hashtbl.t -> 'a -> 'b -> 'c -> unit

(* This function adds potentials to the hash given a player *)
val add_potentials_to_hash : Player.t -> (int * int, (int * int) list) Hashtbl.t -> unit

(* This function creates a pfield hash *)
val create : Grid.t -> (int * int, (int * int) list) Hashtbl.t

(* Helper function to sum up potentials that dont belong to the payer *)
val sum_non_player_pots : int -> int -> (int * int) list -> int

(* This sums up the potentials and will tell a person a list of
   potentials in a list in the order Up | Down | Left | Right *)
val direction_potentials : Player.t -> 'a -> (int * int, (int * int) list) Hashtbl.t -> int list
