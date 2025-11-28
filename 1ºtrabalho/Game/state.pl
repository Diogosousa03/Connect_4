:- module(state, []).
:- use_module('game').

game_check(Board,Current,Color):-
    win_horizontal(Board,Color); % ; is OldRow
    win_Vertical()





%------------Horizontal Win ----------------%
win_in_line(Line, Color) :-
    sublist([Color, Color, Color, Color], Line).


win_horizontal(Board, Color) :-
    member(Row, Board),
    win_in_line(Row, Color).

sublist(S, L) :-
    conc(L1, L2, L),
    conc(S, L3, L2).

%------------------------------------------%


%------------Vertical Win -----------------%
win_Vertical(Board, Color) :-
    


