

:- module(main, [main/0, start/0, start_game/1]).

%modules
:- use_module('Board/board').
:- use_module('Game/game').

main :- start.

start :-
    nl,
    write('========================='), nl,
    write('   Connect 4    '), nl,
    write('========================='), nl,
    game_init.

game_init:-
    empty_board(Board),
    print_board(Board),
    
    start_game(Board).


start_game(Board) :-
    board:print_board(Board),                
    write('Choose a column (1-7): '), nl,
    read(Col),                               


    ( insert(Board, Col, r, NewBoard) -> 
        true
    ; write('Invalid move! Try again.'), nl,
      start_game(Board)                       
    ),

    start_game(NewBoard).                     
