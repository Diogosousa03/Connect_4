%Game logic of the game

:-module(game, [insert/4,get_element/3]).



insert(Board, Index, Value, NewBoard):-
    check_column(Board, Index,empty_Row).



check_column([H|T], Index,empty_Row):-
    get_element(Index,[H|T], Elem).




get_element(Index,[H|_], H).

get_element(Index,[_|T], Elem):-
    Index>1,
    Index1 is Index-1,
    get_element(Index,T,Elem).