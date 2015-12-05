open Assertions

let () = print_string "create 20x20 grid\n"
let grid = Grid.create (20,20)

let () = print_string "tests all 400 cells to be correct cell_status\n"
TEST_UNIT = Grid.dimensions grid === (20, 20)
TEST_UNIT = Grid.status_of_cell grid (0, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 0) === Util.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (3, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (4, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (5, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (6, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (7, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (8, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (9, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (10, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (11, 0) === Util.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (12, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (13, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (14, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (15, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (16, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (17, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (18, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 0) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (1, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (2, 19) === Util.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (3, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (4, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (5, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (6, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (7, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (8, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (9, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (10, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (11, 19) === Util.Wall                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
TEST_UNIT = Grid.status_of_cell grid (12, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (13, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (14, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (15, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (16, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (17, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (18, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 19) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 1) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 2) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 3) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 4) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 5) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 6) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 7) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 8) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 9) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 10) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 11) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 12) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 13) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 14) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 15) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 16) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 17) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (0, 18) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 1) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 2) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 3) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 4) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 5) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 6) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 7) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 8) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 9) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 10) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 11) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 12) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 13) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 14) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 15) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 16) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 17) === Util.Wall
TEST_UNIT = Grid.status_of_cell grid (19, 18) === Util.Wall

let () = print_string "test empty cells\n"
TEST_UNIT = Grid.status_of_cell grid (1, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 1) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 2) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 3) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 4) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 5) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 6) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 7) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 8) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 9) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 10) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 11) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 12) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 13) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 14) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 15) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 16) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 17) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (1, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (2, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (3, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (4, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (5, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (6, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (7, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (8, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (9, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (10, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (11, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (12, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (13, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (14, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (15, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (16, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (17, 18) === Util.Empty
TEST_UNIT = Grid.status_of_cell grid (18, 18) === Util.Empty

let () = print_string "test creation of human player\n"
let new_player = Player.create_human 1 1 (1, 1, 1) "alex"
TEST_UNIT = Player.id new_player === 1
TEST_UNIT = Player.is_human new_player === true
TEST_UNIT = Player.is_ai new_player === false
TEST_UNIT = Player.position new_player === (1, 1)
TEST_UNIT = Player.direction new_player === Util.Down
TEST_UNIT = Player.is_alive new_player === true
TEST_UNIT = Player.label new_player === "alex"
TEST_UNIT = Player.color new_player === (1, 1, 1)
TEST_UNIT = Player.tail_length new_player === 1
TEST_UNIT = Player.tail new_player === []

let () = print_string "test adding a player to grid\n"
let new_grid = Grid.add_player grid new_player
TEST_UNIT = Grid.players new_grid === [new_player]

let () = print_string "test updating direction\n"
TEST_UNIT = Player.update_direction new_player Util.Up === false
TEST_UNIT = Player.update_direction new_player Util.Left === true
TEST_UNIT = Player.direction new_player === Util.Left
TEST_UNIT = Player.update_direction new_player Util.Right === false
TEST_UNIT = Player.update_direction new_player Util.Up === true
TEST_UNIT = Player.direction new_player === Util.Up
TEST_UNIT = Player.update_direction new_player Util.Down === false
TEST_UNIT = Player.update_direction new_player Util.Right === true
TEST_UNIT = Player.direction new_player === Util.Right
TEST_UNIT = Player.update_direction new_player Util.Left === false
TEST_UNIT = Player.update_direction new_player Util.Up === true
TEST_UNIT = Player.direction new_player === Util.Up
TEST_UNIT = Player.update_direction new_player Util.Down === false
TEST_UNIT = Player.update_direction new_player Util.Left === true
TEST_UNIT = Player.direction new_player === Util.Left
TEST_UNIT = Player.update_direction new_player Util.Right === false
TEST_UNIT = Player.update_direction new_player Util.Down === true
TEST_UNIT = Player.direction new_player === Util.Down
TEST_UNIT = Player.update_direction new_player Util.Up === false
TEST_UNIT = Player.update_direction new_player Util.Right === true
TEST_UNIT = Player.direction new_player === Util.Right
TEST_UNIT = Player.update_direction new_player Util.Left === false
TEST_UNIT = Player.update_direction new_player Util.Down === true
TEST_UNIT = Player.direction new_player === Util.Down

let _ = Player.update_direction new_player Util.Left
let _ = Player.update_direction new_player Util.Up

let () = print_string "test killing a human player\n"
let kill = Player.create_human 2 1000 (1, 1, 1) "thomas"
let () = Player.kill kill
TEST_UNIT = Player.tail kill === []
TEST_UNIT = Player.is_alive kill === false

let () = print_string "test updating a player's position\n"
let () = Player.update_position new_player (2, 3)
TEST_UNIT = Player.position new_player === (2, 3)
TEST_UNIT = Player.tail new_player === []
TEST_UNIT = Player.direction new_player === Util.Up

let () = print_string "test advancing a player\n"
let () = Player.advance new_player
TEST_UNIT = Player.position new_player === (2, 2)
TEST_UNIT = Player.tail new_player === [(2, 3)]
TEST_UNIT = Player.direction new_player === Util.Up

let () = print_string "test advancing a grid with one player\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position new_player === (2, 1)
TEST_UNIT = Player.tail new_player === [(2, 2)]
TEST_UNIT = Player.is_alive new_player === true
TEST_UNIT = Grid.status_of_cell new_grid (Player.position new_player) === 
				Util.Player (Player.id new_player)
TEST_UNIT = Grid.status_of_cell new_grid (2, 2) === 
				Util.Trail (Player.id new_player)
TEST_UNIT = Player.score new_player === 2

let () = print_string "test killing a player when running into a wall\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position new_player === (2, 0)
TEST_UNIT = Player.tail new_player === []
TEST_UNIT = Player.is_alive new_player === false
TEST_UNIT = Grid.status_of_cell new_grid (Player.position new_player) === 
				Util.Wall
TEST_UNIT = Player.score new_player === 4

let () = print_string "test grid with multiple human players\n"
let grid2 = Grid.create (50, 50)
let third_player = Player.create_human 3 5 (1, 1, 1) "ilan" 
let fourth_player = Player.create_human 4 10 (1, 1, 1) "eric"
let new_grid = Grid.add_player grid2 third_player
let new_grid = Grid.add_player new_grid fourth_player
TEST_UNIT = Grid.players new_grid === [fourth_player; third_player]

let () = print_string "test player_with_id\n"
TEST_UNIT = Grid.player_with_id new_grid 3 === Some third_player
TEST_UNIT = Grid.player_with_id new_grid 5 === None
TEST_UNIT = Grid.player_with_id new_grid 4 === Some fourth_player

let () = Player.update_position third_player (1, 1)
let () = Player.update_position fourth_player (1, 2)
let _ = Player.update_direction third_player Util.Right
let _ = Player.update_direction fourth_player Util.Right

let () = print_string "tick1 with multiple players on grid\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (2, 1)
TEST_UNIT = Player.position fourth_player === (2, 2)
TEST_UNIT = Player.tail third_player === [(1,1)]
TEST_UNIT = Player.tail fourth_player === [(1, 2)]
TEST_UNIT = Player.score third_player === 2 
TEST_UNIT = Player.score fourth_player === 2

let () = print_string "tick2 with multiple players on grid\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (3, 1)
TEST_UNIT = Player.position fourth_player === (3, 2)
TEST_UNIT = Player.tail third_player === [(2, 1); (1, 1)]
TEST_UNIT = Player.tail fourth_player === [(2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 4
TEST_UNIT = Player.score fourth_player === 4

let () = print_string "tick3 with multiple players on grid\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (4, 1)
TEST_UNIT = Player.position fourth_player === (4, 2)
TEST_UNIT = Player.tail third_player === [(3, 1); (2, 1); (1, 1)]
TEST_UNIT = Player.tail fourth_player === [(3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 6
TEST_UNIT = Player.score fourth_player === 6

let () = print_string "tick4 with multiple players on grid\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (5, 1)
TEST_UNIT = Player.position fourth_player === (5, 2)
TEST_UNIT = Player.tail third_player === [(4, 1); (3, 1); (2, 1); (1, 1)]
TEST_UNIT = Player.tail fourth_player === [(4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 8
TEST_UNIT = Player.score fourth_player === 8

let () = print_string "tick5 with multiple players on grid\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (6, 1)
TEST_UNIT = Player.position fourth_player === (6, 2)
TEST_UNIT = Player.tail third_player === 
			[(5, 1); (4, 1); (3, 1); (2, 1); (1, 1)]
TEST_UNIT = Player.tail fourth_player === 
			[(5, 2); (4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 10 
TEST_UNIT = Player.score fourth_player === 10

let () = print_string "tick6 check if tail correctly disappears"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (7, 1)
TEST_UNIT = Player.position fourth_player === (7, 2)
TEST_UNIT = Player.tail third_player === 
			[(6, 1); (5, 1); (4, 1); (3, 1); (2, 1)]
TEST_UNIT = Player.tail fourth_player === 
			[(6, 2); (5, 2); (4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 12 
TEST_UNIT = Player.score fourth_player === 12

let () = print_string "tick7\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (8, 1)
TEST_UNIT = Player.position fourth_player === (8, 2)
TEST_UNIT = Player.tail third_player === 
			[(7, 1); (6, 1); (5, 1); (4, 1); (3, 1)]
TEST_UNIT = Player.tail fourth_player === 
			[(7, 2); (6, 2); (5, 2); (4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 14 
TEST_UNIT = Player.score fourth_player === 14

let () = print_string "tick8\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (9, 1)
TEST_UNIT = Player.position fourth_player === (9, 2)
TEST_UNIT = Player.tail third_player === 
			[(8, 1); (7, 1); (6, 1); (5, 1); (4, 1)]
TEST_UNIT = Player.tail fourth_player === 
			[(8, 2); (7, 2); (6, 2); (5, 2); (4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 16 
TEST_UNIT = Player.score fourth_player === 16

let () = print_string "test killing a player on player/trail\n"
let _ = Player.update_direction third_player Util.Down
TEST_UNIT = Grid.status_of_cell new_grid (Util.add_cells 
			(Player.position third_player) (Util.vector_of_direction 
			(Player.direction third_player))) === 
			Util.Player (Player.id fourth_player)
let () = Grid.act new_grid
TEST_UNIT = Player.position third_player === (9, 2)
TEST_UNIT = Player.is_alive third_player === false
TEST_UNIT = Player.tail third_player === []
TEST_UNIT = Player.position fourth_player === (10, 2)
TEST_UNIT = Player.tail fourth_player === 
			[(9, 2); (8, 2); (7, 2); (6, 2); (5, 2); (4, 2); 
			(3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score third_player === 18 
TEST_UNIT = Player.score fourth_player === 1018

let () = print_string "tick10 to see if score updates correctly\n"
let _ = Player.update_direction fourth_player Util.Down
let () = Grid.act new_grid
TEST_UNIT = Player.position fourth_player === (10, 3)
TEST_UNIT = Player.tail fourth_player === 
			[(10, 2); (9, 2); (8, 2); (7, 2); (6, 2); 
			(5, 2); (4, 2); (3, 2); (2, 2); (1, 2)]
TEST_UNIT = Player.score fourth_player === 1020

let () = print_string "tick 11\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fourth_player === (10, 4)
TEST_UNIT = Player.tail fourth_player === 
			[(10, 3); (10, 2); (9, 2); (8, 2); (7, 2); 
			(6, 2); (5, 2); (4, 2); (3, 2); (2, 2)]
TEST_UNIT = Player.score fourth_player === 1022

let () = print_string "test occupies_cell\n"
TEST_UNIT = Player.occupies_cell fourth_player (9, 2) === true
TEST_UNIT = Player.occupies_cell fourth_player (10, 5) === false
TEST_UNIT = Player.occupies_cell fourth_player (10, 4) === true
TEST_UNIT = Player.occupies_cell fourth_player (49, 49) === false

let () = print_string "test killing player against wall with score\n"
let () = Player.update_position fourth_player (48, 48)
let () = Grid.act new_grid
TEST_UNIT = Player.position fourth_player === (48, 49)
TEST_UNIT = Player.is_alive fourth_player === false
TEST_UNIT = Player.tail fourth_player === []
TEST_UNIT = Player.score fourth_player === 1024

let () = print_string "test dead players\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fourth_player === (48, 49)
TEST_UNIT = Player.position third_player === (9, 2)
TEST_UNIT = Player.is_alive fourth_player === false
TEST_UNIT = Player.is_alive third_player === false
TEST_UNIT = Player.tail fourth_player === []
TEST_UNIT = Player.tail third_player === []
TEST_UNIT = Player.score fourth_player === 1024
TEST_UNIT = Player.score third_player === 18

let () = print_string "test2 dead players\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fourth_player === (48, 49)
TEST_UNIT = Player.position third_player === (9, 2)
TEST_UNIT = Player.is_alive fourth_player === false
TEST_UNIT = Player.is_alive third_player === false
TEST_UNIT = Player.tail fourth_player === []
TEST_UNIT = Player.tail third_player === []
TEST_UNIT = Player.score fourth_player === 1024
TEST_UNIT = Player.score third_player === 18


let () = print_string "test vector_of_direction\n"
TEST_UNIT = Util.vector_of_direction (Util.Up) === (0, -1)
TEST_UNIT = Util.vector_of_direction (Util.Down) === (0, 1)
TEST_UNIT = Util.vector_of_direction (Util.Left) === (-1, 0)
TEST_UNIT = Util.vector_of_direction (Util.Right) === (1, 0)

let () = print_string "test add_cells\n"
TEST_UNIT = Util.add_cells (1, 2) (2, 1) === (3, 3)

let () = print_string "Spawn food and see if Grid represents state correctly\n"

let rec helper g =
	let () = Grid.spawn_food new_grid in
	let x = Util.unwrap (Grid.get_food new_grid) in
    let (x2, y2) = Util.cell_to_tuple x in
    if x2 >= 47 then helper g else (x2, y2)

let (x1, y1) = helper new_grid
TEST_UNIT = Grid.status_of_cell new_grid (x1, y1) === Util.Food

let () = print_string "spawn test_player to get food\n"
let fifth_player = Player.create_human 5 1 (1, 1, 1) "get food"
let new_grid = Grid.add_player new_grid fifth_player
TEST_UNIT = Player.tail_length fifth_player === 1

let () = print_string "set up player right next to food\n"
let () = Player.update_position fifth_player (x1 - 1, y1)
let _ = Player.update_direction fifth_player Util.Right

let () = print_string "tick1 to see if player eats food and mutates correctly\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fifth_player === (x1, y1)
TEST_UNIT = Player.score fifth_player === 102
TEST_UNIT = Player.is_alive fifth_player === true
TEST_UNIT = Player.tail fifth_player === [(x1-1, y1)]
TEST_UNIT = Player.tail_length fifth_player === 2

let () = print_string "tick2 to see if tail generates properly\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fifth_player === (x1 + 1, y1)
TEST_UNIT = Player.score fifth_player === 104
TEST_UNIT = Player.is_alive fifth_player === true
TEST_UNIT = Player.tail fifth_player === [(x1, y1); (x1-1,y1)]
TEST_UNIT = Player.tail_length fifth_player === 2

let () = print_string "tick3 to see if player acts correctly\n"
let () = Grid.act new_grid
TEST_UNIT = Player.position fifth_player === (x1 + 2, y1)
TEST_UNIT = Player.score fifth_player === 106
TEST_UNIT = Player.is_alive fifth_player === true
TEST_UNIT = Player.tail fifth_player === [(x1+1, y1); (x1, y1)]
TEST_UNIT = Player.tail_length fifth_player === 2

let () = print_string "100% Passed\n"