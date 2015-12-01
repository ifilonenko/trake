open Assertions

let grid = Grid.create (3,3)

TEST_UNIT = Grid.dimensions grid === (3, 3)
TEST_UNIT = Grid.status_of_cell grid (0, 0) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 0) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 0) === Grid.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (0, 2) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 2) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 2) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 1) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 1) === Grid.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 1) === Grid.Empty

let new_grid = Grid.create (20, 20)

TEST_UNIT = Grid.dimensions new_grid === (20, 20)
let added_players = Grid.add_player new_grid 

TEST_UNIT = Player.vector_of_direction Player.Up === (0, 1)
TEST_UNIT = Player.vector_of_direction Player.Down === (0, -1)
TEST_UNIT = Player.vector_of_direction Player.Left === (-1, 0)
TEST_UNIT = Player.vector_of_direction Player.Right === (1, 0)

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