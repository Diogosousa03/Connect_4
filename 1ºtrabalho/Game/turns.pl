:- module(turns, [init_turn/2, next_turn/4]).

% Available pieces
available_pieces([r,y,b,w]).

% -------------------------
% INIT TURN
% -------------------------
init_turn(P1, P2) :- 
    available_pieces(List1),
    format('Player 1, choose a piece: ~w~n', [List1]),
    read(Piece1),
    P1 = player(1, Piece1),

    remove_available_pieces(Piece1, List1, List2),
    write('HELLLLLOOOOOOOOOO'),
    format('Player 2, choose a piece: ~w~n', [List2]),
    read(Piece2),
    P2 = player(2, Piece2).


% -------------------------
% REMOVE PIECE FROM LIST
% -------------------------
remove_available_pieces(Piece, [Piece|Tail], Tail).
remove_available_pieces(Piece, [H|T], [H|T1]) :-
    remove_available_pieces(Piece, T, T1).


% -------------------------
% SWITCH TURN
% -------------------------
next_turn(Current, P1, P2, Next) :-
    (Current = P1 ->
        Next = P2
    ;
        Next = P1
    ).
