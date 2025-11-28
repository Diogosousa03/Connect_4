

%Board representation and printing

:- module(board, [empty_board/1,print_board/1]).


empty_board([
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ']
]).
print_board(Board) :-
    nl,
    write(' 1  2  3  4  5  6  7'), nl,
    write('---------------------'), nl,
    print_rows(Board),
    write('---------------------'), nl.

% Percorre todas as linhas

print_rows([]) :- !.

print_rows([H|T]) :-
    print_row(H),
    print_rows(T).

% Imprime uma linha
print_row(H) :-
    print_cells(H),
    nl.

% Percorre todas as células de uma linha
print_cells([]) :- !.
print_cells([H|T]) :-
    write(H), write('|'),write('_'),write('|'),
    print_cells(T).    

