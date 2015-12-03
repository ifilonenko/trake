(* ai is in charge of abstracting all the decision making of the ai
 * into a seperate file. The Ai will be given a Player and Grid and calculate
 * the best direction to go in response to the givens.
 *)
(* Implement a queue for DFS *)
module Queue :
  sig type 'a t = ('a list * 'a list) ref
  exception Empty
  val create : unit -> ('a list * 'b list) ref
  val enqueue : 'a -> ('a list * 'b) ref -> unit
  val dequeue : ('a list * 'a list) ref -> 'a
  val is_empty : ('a list * 'a list) ref -> bool
end

(* Grab max of a list *)
val max_val: 'a list -> 'a

(* Grab list of indexes which contain the max value *)
val index_list_of_maxes : int list -> int -> int -> int list

(* Grab directions given the indexes *)
val direction_list : int list -> 'a list -> 'a list

(* Generate a list of distances to see how far the dangers are from the AI
   in the order of Up | Down | Left | Right *)
val distance_list : Player.t -> Grid.t -> int list

(* Sum two lists together with same number of elements *)
val sum_equal_lists : int list -> int list -> int list

(* Print helper *)
val print_int_list : int list -> unit

(* returns a direction that the AI should move based on various computations *)
val new_direction: Player.t -> Grid.t -> unit

(* Generate a list of distances to see how far the AI is from the food in the
   order of best distances from the previous ccomputation *)
val shortest_food_finder : Player.t -> Grid.t -> int list
