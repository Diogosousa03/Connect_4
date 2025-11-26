:- module(turns, [init_turn/0]).

%R -> Red Piece
%Y -> Yellow Piece
%B -> Black Piece
%W -> White Piece

available_pieces([r,y,b,w]).

init_turn(Piece1,Piece2):- 
    format('Player 1, choose a piece: ~w~n',[available_pieces]),
    read(Piece1),
    remove_available_pieces(Piece1,available_pieces,NewAvailablePieces),
    format('Player 2, choose a piece: ~w~n',[NewAvailablePieces]),
    read(Piece2)




remove_available_pieces(piece,[piece|Tail],NewList).

remove_available_pieces(piece,[Head|Tail],[Head|Tail1]):-
    remove_available_pieces(piece,Tail,Tail1).
    
