/******************************************************************************/
/*  Welt mit rasterförmigen Hindernissen                                      */
/*----------------------------------------------------------------------------*/
%  y
%    +---+---+---+---+---+---+---+---+
%  1 | S |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  2 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  3 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  4 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  5 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  6 |   |###|   |   |   |###|   |   |
%    +---+---+---+---+---+---+---+---+
%  7 |   |   |   |###|   |   |   |###|
%    +---+---+---+---+---+---+---+---+
%  8 |   |###|   |   |   |###|   | Z |
%    +---+---+---+---+---+---+---+---+
%      1   2   3   4   5   6   7   8    x
%
/*----------------------------------------------------------------------------*/
nb(k(1,1),k(2,1)).
nb(k(2,1),k(1,1)).
nb(k(2,1),k(3,1)).
nb(k(3,1),k(2,1)).
nb(k(5,1),k(6,1)).
nb(k(6,1),k(5,1)).
nb(k(6,1),k(7,1)).
nb(k(7,1),k(6,1)).
nb(k(3,2),k(4,2)).
nb(k(4,2),k(3,2)).
nb(k(4,2),k(5,2)).
nb(k(5,2),k(4,2)).
nb(k(7,2),k(8,2)).
nb(k(8,2),k(7,2)).
nb(k(1,3),k(2,3)).
nb(k(2,3),k(1,3)).
nb(k(2,3),k(3,3)).
nb(k(3,3),k(2,3)).
nb(k(5,3),k(6,3)).
nb(k(6,3),k(5,3)).
nb(k(6,3),k(7,3)).
nb(k(7,3),k(6,3)).
nb(k(3,4),k(4,4)).
nb(k(4,4),k(3,4)).
nb(k(4,4),k(5,4)).
nb(k(5,4),k(4,4)).
nb(k(7,4),k(8,4)).
nb(k(8,4),k(7,4)).
nb(k(1,5),k(2,5)).
nb(k(2,5),k(1,5)).
nb(k(2,5),k(3,5)).
nb(k(3,5),k(2,5)).
nb(k(5,5),k(6,5)).
nb(k(6,5),k(5,5)).
nb(k(6,5),k(7,5)).
nb(k(7,5),k(6,5)).
nb(k(3,6),k(4,6)).
nb(k(4,6),k(3,6)).
nb(k(4,6),k(5,6)).
nb(k(5,6),k(4,6)).
nb(k(7,6),k(8,6)).
nb(k(8,6),k(7,6)).
nb(k(1,7),k(2,7)).
nb(k(2,7),k(1,7)).
nb(k(2,7),k(3,7)).
nb(k(3,7),k(2,7)).
nb(k(5,7),k(6,7)).
nb(k(6,7),k(5,7)).
nb(k(6,7),k(7,7)).
nb(k(7,7),k(6,7)).
nb(k(3,8),k(4,8)).
nb(k(4,8),k(3,8)).
nb(k(4,8),k(5,8)).
nb(k(5,8),k(4,8)).
nb(k(7,8),k(8,8)).
nb(k(8,8),k(7,8)).
nb(k(1,1),k(1,2)).
nb(k(1,2),k(1,1)).
nb(k(1,2),k(1,3)).
nb(k(1,3),k(1,2)).
nb(k(1,3),k(1,4)).
nb(k(1,4),k(1,3)).
nb(k(1,4),k(1,5)).
nb(k(1,5),k(1,4)).
nb(k(1,5),k(1,6)).
nb(k(1,6),k(1,5)).
nb(k(1,6),k(1,7)).
nb(k(1,7),k(1,6)).
nb(k(1,7),k(1,8)).
nb(k(1,8),k(1,7)).
nb(k(3,1),k(3,2)).
nb(k(3,2),k(3,1)).
nb(k(3,2),k(3,3)).
nb(k(3,3),k(3,2)).
nb(k(3,3),k(3,4)).
nb(k(3,4),k(3,3)).
nb(k(3,4),k(3,5)).
nb(k(3,5),k(3,4)).
nb(k(3,5),k(3,6)).
nb(k(3,6),k(3,5)).
nb(k(3,6),k(3,7)).
nb(k(3,7),k(3,6)).
nb(k(3,7),k(3,8)).
nb(k(3,8),k(3,7)).
nb(k(5,1),k(5,2)).
nb(k(5,2),k(5,1)).
nb(k(5,2),k(5,3)).
nb(k(5,3),k(5,2)).
nb(k(5,3),k(5,4)).
nb(k(5,4),k(5,3)).
nb(k(5,4),k(5,5)).
nb(k(5,5),k(5,4)).
nb(k(5,5),k(5,6)).
nb(k(5,6),k(5,5)).
nb(k(5,6),k(5,7)).
nb(k(5,7),k(5,6)).
nb(k(5,7),k(5,8)).
nb(k(5,8),k(5,7)).
nb(k(7,1),k(7,2)).
nb(k(7,2),k(7,1)).
nb(k(7,2),k(7,3)).
nb(k(7,3),k(7,2)).
nb(k(7,3),k(7,4)).
nb(k(7,4),k(7,3)).
nb(k(7,4),k(7,5)).
nb(k(7,5),k(7,4)).
nb(k(7,5),k(7,6)).
nb(k(7,6),k(7,5)).
nb(k(7,6),k(7,7)).
nb(k(7,7),k(7,6)).
nb(k(7,7),k(7,8)).
nb(k(7,8),k(7,7)).