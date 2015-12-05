type direction = Up | Down | Left | Right
type cell_status = Player of int | Trail of int | Wall | Empty | Food
type cell = int * int

let add_cells (c1x, c1y) (c2x, c2y) =
  (c1x + c2x, c1y + c2y)

let vector_of_direction d =
  match d with
  | Up -> (0, 1)
  | Down -> (0, -1)
  | Left -> (-1, 0)
  | Right -> (1, 0)

let direction_of_string s =
  match s with
  | "up"
  | "Up" -> Up
  | "down"
  | "Down" -> Down
  | "left"
  | "Left" -> Left
  | "right"
  | "Right" -> Right
  | _ -> Up

let string_of_direction d =
  match d with
  | Up -> "Up"
  | Down -> "Down"
  | Left -> "Left"
  | Right -> "Right"

let json_of_cell (x, y) =
  `Assoc [("x", `Int x); ("y", `Int y)]

let cell_of_json json =
  let open Yojson.Basic.Util in
  match json with
  | `Assoc l ->
    let x = List.assoc "x" l |> to_int in
    let y = List.assoc "y" l |> to_int in
    (x, y)
  | _ -> failwith "Invalid JSON for cell_of_json"
