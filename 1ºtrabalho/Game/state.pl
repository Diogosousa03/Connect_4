:- module(state, [game_check/2, stalemate_check/1]).

:- use_module('game').     % For get_element/3


/* ============================================================
   GAME CHECK
   Checks if the current player has won.
   Current = player(Number, Color)
   ============================================================ */

game_check(Board, player(_, Color)) :-
    win_horizontal(Board, Color);
    win_vertical(Board, Color);
    win_diagonal(Board, Color).


/* ============================================================
   STALEMATE CHECK
   True if the board has no empty spaces
   ============================================================ */
stalemate_check(Board) :-
    member(Row, Board),
    member(' ', Row).


/* ============================================================
   1. HORIZONTAL WIN
   ============================================================ */
win_in_line(Line, Color) :-
    sublist([Color, Color, Color, Color], Line).

win_horizontal(Board, Color) :-
    member(Row, Board),
    win_in_line(Row, Color).


/* -------- sublist + conc helper -------- */
sublist(S, L) :-
    conc(_, Tail, L),
    conc(S, _, Tail).

conc([], L, L).
conc([H|T], L2, [H|R]) :-
    conc(T, L2, R).


/* ============================================================
   2. VERTICAL WIN
   ============================================================ */
win_vertical(Board, Color) :-
    transpose(Board, Columns),
    win_horizontal(Columns, Color).

transpose([[]|_], []) :- !.
transpose(Matrix, [Column|Rest]) :-
    first_column(Matrix, Column, RemainingRows),
    transpose(RemainingRows, Rest).

first_column([], [], []).
first_column([[H|T]|Rest], [H|Hs], [T|Ts]) :-
    first_column(Rest, Hs, Ts).


/* ============================================================
3. DIAGONAL WIN  (FULLY FIXED)
============================================================ */

win_diagonal(Board, Color) :-
win_diag_down_right(Board, Color);
win_diag_down_left(Board, Color).

/* ----------------------------------------------
\  DIAGONAL  (down-right)
Starts only where a 4-length diagonal is possible
---------------------------------------------- */
win_diag_down_right(Board, Color) :-
between(1, 3, Row),      % only rows 1..3 can start a \ diagonal of length >=4
between(1, 4, Col),      % only cols 1..4
diag_down_right(Board, Row, Col, Diag),
sublist([Color,Color,Color,Color], Diag).

diag_down_right(Board, Row, Col, [E|Rest]) :-
safe_get(Board, Row, Col, E),
R2 is Row + 1,
C2 is Col + 1,
diag_down_right(Board, R2, C2, Rest).
diag_down_right(_, Row, Col, []) :-
(Row > 6 ; Col > 7).

/* ----------------------------------------------
/  DIAGONAL (down-left)
---------------------------------------------- */
win_diag_down_left(Board, Color) :-
between(1, 3, Row),
between(4, 7, Col),
diag_down_left(Board, Row, Col, Diag),
sublist([Color,Color,Color,Color], Diag).

diag_down_left(Board, Row, Col, [E|Rest]) :-
safe_get(Board, Row, Col, E),
R2 is Row + 1,
C2 is Col - 1,
diag_down_left(Board, R2, C2, Rest).
diag_down_left(_, Row, Col, []) :-
(Row > 6 ; Col < 1).

/* -------- safe_get ---------- */
safe_get(Board, Row, Col, Elem) :-
Row >= 1, Row =< 6,
Col >= 1, Col =< 7,
get_element(Row, Board, Line),
get_element(Col, Line, Elem).
