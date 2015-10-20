:- [board].
%:- [moves].

:- use_module(library(lists)).
:- use_module(library(clpfd)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start(BoardState):-
    emptyBoard(BoardState), nl,
    printBoard(BoardState),
    reverse(BoardState, Inv),
    nl, nl, nl,
    printBoard(Inv).