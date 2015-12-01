open Assertions

let grid = Grid.create (3,3)

TEST_UNIT = Grid.dimensions grid === (3, 3)
TEST_UNIT = Grid.status_of_cell grid (0, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 0) === Util.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (0, 2) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 2) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 2) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 1) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 1) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 1) === Util.Empty

let new_grid = Grid.create (20, 20)

TEST_UNIT = Grid.dimensions new_grid === (20, 20)
let added_players = Grid.add_player new_grid 

TEST_UNIT = Util.vector_of_direction (Util.Up) === (0, 1)
TEST_UNIT = Util.vector_of_direction (Util.Down) === (0, -1)
TEST_UNIT = Util.vector_of_direction (Util.Left) === (-1, 0)
TEST_UNIT = Util.vector_of_direction (Util.Right) === (1, 0)

TEST_UNIT = Util.add_cells (1, 2) (2, 1) === (3, 3)
(* 
TEST "status_of_cell_grid" = 
TEST "create_grid" =
TEST "add_player_grid" =
TEST "prune_player_grid" =
TEST "add_cells_player" =
TEST "vector_of_direction_player" =
TEST "player_methods" =
TEST "occupies_cell_player" =
TEST "advance_player" =
 *)