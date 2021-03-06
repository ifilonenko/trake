type color = int * int * int

type t = {
  id: int;
  label: string;
  color: color;
  mutable score: int;
  mutable alive: bool;
  mutable direction: Util.direction;
  mutable next_direction: Util.direction;
  mutable tail_length: int;
  mutable position: int * int;
  mutable tail: (int * int) list;
  original_tail_length: int;
  human: bool
}

(* Creates a human player *)
let create_human id tl clr lbl =
  {
    id = id;
    label = lbl;
    color = clr;
    alive = true;
    direction = Util.Down;
    next_direction = Util.Down;
    tail_length = tl;
    original_tail_length = tl;
    position = (1, 1);
    tail = [];
    score = 0;
    human = true;
  }

let ai_count = ref (-1)

(* Creates an AI player *)
let create_ai tl clr =
  ai_count := !ai_count - 1;
  {
    id = !ai_count;
    label = Printf.sprintf "Robot %d" (-(!ai_count));
    color = clr;
    alive = true;
    direction = Util.Down;
    next_direction = Util.Down;
    tail_length = tl;
    original_tail_length = tl;
    position = (1,1);
    score = 0;
    tail = [];
    human = false;
  }

let id p =
  p.id

let is_human p =
  p.human

let is_ai p =
  not (p.human)

let direction p =
  p.next_direction

(* Sets the next direction of the player *)
let update_direction p d =
  Util.(
  match (p.direction, d) with
  | (Left, Right)
  | (Right, Left)
  | (Down, Up)
  | (Up, Down) -> false
  | _ -> p.next_direction <- d; true
  )

let update_position p c =
  p.position <- c

let is_alive p =
  p.alive

let kill p =
  p.tail <- [];
  p.alive <- false

let reanimate p =
  p.alive <- true;
  p.tail <- [];
  p.tail_length <- p.original_tail_length

let label p =
  p.label

let color p =
  p.color

let tail_length p =
  p.tail_length

let score p =
  p.score

let add_score p i =
  p.score <- (score p) + i

let eat_food p =
  p.tail_length <- (tail_length p) + 1

let position p =
  p.position

(* Updates the frontend with a json of the player *)
let to_json_update p =
  `Assoc [
    ("id", `Int (id p));
    ("direction", `String (Util.string_of_direction (direction p)));
    ("tail_length", `Int (tail_length p));
    ("score", `Int 0);
    ("position", Util.json_of_cell (position p));
    ("alive", `Bool (is_alive p));
    ("score", `Int (score p))
  ]

(* Updates the frontend with the json of the initial players *)
let to_json_initial p =
  let (r, g, b) = color p in
  match to_json_update p with
  | `Assoc x -> `Assoc ([
    ("label", `String (label p));
    ("color", `String (Printf.sprintf "rgb(%i, %i, %i)" r g b));
    ("human", `Bool (is_human p))
  ] @ x)
  | _ -> `Null

let tail p =
  p.tail

let occupies_cell p c =
  (position p) = c ||
    List.mem c (tail p)

(* Makes the player advance in the grid *)
let advance p =
  (* Get new position *)
  let () = p.direction <- p.next_direction in
  let delta = Util.vector_of_direction (direction p) in
  let pos = position p in
  let new_pos = Util.add_cells pos delta in

  (* Add old position to tail list *)
  let new_tail = pos::(tail p) in

  (* Remove extra pieces from tail list *)
  let rec helper tl l =
    if l <= 0 then
      tl
    else
      let rev_list = List.rev tl in
      match rev_list with
      | h::t -> List.rev t
      | [] -> []
  in
  if is_alive p = true then
    let () = p.tail <- (helper new_tail ((List.length new_tail) - tail_length p))
  in
    p.position <- new_pos
  else
    p.position <- new_pos

(* Resets a player *)
let reset p =
  p.score <- 0;
  p.tail <- [];
  p.alive <- true;
  p.tail_length <- p.original_tail_length
