

:- module(main, [main/0, start/0]).

%modules
:- use_module('Board/board').

main :- start.

start :-
    nl,
    write('========================='), nl,
    write('   Connect 4 (Prolog)   '), nl,
    write('========================='), nl,
    game_init.

game_init:-
    empty_board(Board),
    print_board(Board).
