:- [board].
%:- [moves].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start(BoardState):-
    emptyBoard(BoardState),
    printBoard(BoardState).