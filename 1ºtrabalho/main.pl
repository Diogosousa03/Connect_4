

:- module(main, [main/0, start/0, start_game/1]).

%modules
:- use_module('Board/board').
:- use_module('Game/game').
:- use_module('Game/turns').


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
    init_turn(P1,P2),
    Current = P1,
    start_game(Board,P1,P2,Current).


start_game(Board, P1, P2, Current) :-
    print_board(Board),
    write('Choose a column (1-7): '), nl,
    read(Col),
    Current = player(_, ColorPlay),       % Extract color for the move
    ( insert(Board, Col, ColorPlay, NewBoard) ->
        true
    ; write('Invalid move! Try again.'), nl,
      start_game(Board, P1, P2, Current)  % Retry same player
    ),
    next_turn(Current, P1, P2, Next),     % Determine next player
    start_game(NewBoard, P1, P2, Next).   % Recursive call with updated board and next player
