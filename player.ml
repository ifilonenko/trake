type color = int * int * int

type t = {
  id: int;
  label: string;
  color: color;
  mutable alive: bool;
  mutable direction: Util.direction;
  mutable tail_length: int;
  mutable position: int * int;
  mutable tail: (int * int) list;
  human: bool
}

let create_human id tl clr lbl =
  {
    id = id;
    label = lbl;
    color = clr;
    alive = true;
    direction = Util.Down;
    tail_length = tl;
    position = (1, 1);
    tail = [];
    human = true;
  }

let ai_count = ref (-1)

let create_ai tl clr =
  ai_count := !ai_count - 1;
  {
    id = !ai_count;
    label = Printf.sprintf "Robot %d" (-(!ai_count));
    color = clr;
    alive = true;
    direction = Util.Down;
    tail_length = tl;
    position = (1,1);
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
  p.direction

let update_direction p d =
  p.direction <- d

let update_position p c =
  p.position <- c

let is_alive p =
  p.alive

let kill p =
  p.tail <- [];
  p.alive <- false

let label p =
  p.label

let color p =
  p.color

let tail_length p =
  p.tail_length


let eat_food p =
  p.tail_length <- (tail_length p) + 1

let position p =
  p.position

let to_json_update p =
  `Assoc [
    ("id", `Int (id p));
    ("direction", `String (Util.string_of_direction (direction p)));
    ("tail_length", `Int (tail_length p));
    ("score", `Int 0);
    ("position", Util.json_of_cell (position p));
    ("alive", `Bool (is_alive p))
  ]

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

let advance p =
  (* Get new position *)
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
