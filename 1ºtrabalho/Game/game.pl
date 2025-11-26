:- module(game, [insert/4,get_element/3]).

% Get element at index (1-based)
get_element(1,[H|_], H).
get_element(Index, [_|T], Elem) :-
    Index > 1,
    Index1 is Index - 1,
    get_element(Index1, T, Elem).

% Replace element at index (1-based)
replace([_|T], 1, X, [X|T]).
replace([H|T], Index, X, [H|R]) :-
    Index > 1,
    Index1 is Index - 1,
    replace(T, Index1, X, R).

% Insert a piece in a column (gravity: falls to the lowest empty row)
insert(Board, ColIndex, Piece, NewBoard) :-
    first_empty_row(Board, ColIndex, RowIndex),
    get_element(RowIndex, Board, OldRow),
    replace(OldRow, ColIndex, Piece, NewRow),
    replace(Board, RowIndex, NewRow, NewBoard).

% Find first empty row in a column (from bottom)
first_empty_row(Board, ColIndex, RowIndex) :-
    reverse(Board, RevBoard),
    first_empty_row_bottom(RevBoard, ColIndex, 1, RevIndex),
    length(Board, Len),
    RowIndex is Len - RevIndex + 1.

first_empty_row_bottom([Row|_], ColIndex, CurrentIndex, CurrentIndex) :-
    nonvar(ColIndex),
    get_element(ColIndex, Row, Elem),
    Elem == ' '.

first_empty_row_bottom([_|T], ColIndex, CurrentIndex, RowIndex) :-
    NextIndex is CurrentIndex + 1,
    first_empty_row_bottom(T, ColIndex, NextIndex, RowIndex).
