<<<<<<< HEAD:boardAscii.pl
%     /\/\/\/\/\
%     | | | | | |
%    /\/\/\/\/\/\
%    | | | | | | |
%   /\/\/\/\/\/\/\
%   | | | | | | | |
%  /\/\/\/\/\/\/\/\
%  | | | | | | | | |
% /\/\/\/\/\/\/\/\/\
% | | | | | | | | | |
% \/\/\/\/\/\/\/\/\/
%  | | | | | | | | |
%  \/\/\/\/\/\/\/\/
%   | | | | | | | |
%   \/\/\/\/\/\/\/
%    | | | | | | |
%    \/\/\/\/\/\/
%     | | | | | |
%     \/\/\/\/\/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BOARD  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

emptyBoard([[0,0,0,0,0],
            [0,0,0,0,0,0],
            [0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0,0],
            [0,0,0,0,0,0,0],
            [0,0,0,0,0,0],
            [0,0,0,0,0]]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  BOARD PRINTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

translateChar(0, ' ').
translateChar(1, 1).
translateChar(2, 2).
translateChar(3, 3).

drawBorders(1):-
    write(' '),write(' '),write(' '),write(' '),write(' '),
    write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),
    nl.
drawBorders(2):-
    write(' '),write(' '),write(' '),write(' '),
    write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),
    nl.
drawBorders(3):-
    write(' '),write(' '),write(' '),
    write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),
    nl.
drawBorders(4):-
    write(' '),write(' '),
    write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),
    nl.
drawBorders(5):-
    write(' '),
    write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),write('/'), write('\\'),
    nl.
drawBorders(6):-
    write(' '),
    write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),
    nl.
drawBorders(7):-
    write(' '),write(' '),
    write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),
    nl.
drawBorders(8):-
    write(' '),write(' '),write(' '),
    write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),
    nl.
drawBorders(9):-
    write(' '),write(' '),write(' '),write(' '),
    write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),
    nl.
drawBorders(10):-
    write(' '),write(' '),write(' '),write(' '),write(' '),
    write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),write('\\'),write('/'),
    nl.

drawSpaces(3):-
    write(' '),write(' '),write(' '),write(' ').
drawSpaces(4):-
    write(' '),write(' '),write(' ').
drawSpaces(5):-
    write(' '),write(' ').
drawSpaces(6):-
    write(' ').
drawSpaces(7):-
    write(' '),write(' ').
drawSpaces(8):-
    write(' '),write(' '),write(' ').
drawSpaces(9):-
    write(' '),write(' '),write(' '),write(' ').
drawSpaces(10):-
    write(' '),write(' '),write(' '),write(' '),write(' ').


printLine([]).
printLine([H|T]):-
    translateChar(H, Elem),
    write('|'),
    write(Elem),
    printLine(T).


printBoard([]).
printBoard(X,[]).
printBoard([H|T]):-
    drawBorders(1),
    write(' '),write(' '),write(' '),write(' '),write(' '),
    printLine(H),
    nl,
    drawBorders(2),
    printBoard(3,T).
printBoard(X,[H|T]):-
    drawSpaces(X),
    printLine(H),
    nl,
    drawBorders(X),
    X2 is X + 1,
    printBoard(X2,T).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start(B):-
    emptyBoard(B),
    printBoard(B).
=======
%   ABCDEFGHIJKLMNOPQ
%      /\/\/\/\/\
%A     | | | | | |
%     /\/\/\/\/\/\
%B    | | | | | | |
%    /\/\/\/\/\/\/\
%C   | | | | | | | |
%   /\/\/\/\/\/\/\/\
%D  | | | | | | | | |
%  /\/\/\/\/\/\/\/\/\
%E | | | | | | | | | |
%  \/\/\/\/\/\/\/\/\/
%F  | | | | | | | | |
%   \/\/\/\/\/\/\/\/
%G   | | | | | | | |
%    \/\/\/\/\/\/\/
%H    | | | | | | |
%     \/\/\/\/\/\/
%I     | | | | | |
%      \/\/\/\/\/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BOARD  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

emptyBoard([[0,0,0,0,0,1,2,1,2,1,2,1,2,1,2,0,0,0,0,0],
            [0,0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0,0],
            [0,0,0,0,1,2,1,2,1,2,1,2,1,2,1,2,0,0,0,0],
            [0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0],
            [0,0,0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0,0,0],
            [0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0],
            [0,0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0,0],
            [0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0],
            [0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0],
            [0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3],
            [0,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,0],
            [0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0],
            [0,0,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,0,0],
            [0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0],
            [0,0,0,2,1,2,1,2,1,2,1,2,1,2,1,2,1,0,0,0],
            [0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0],
            [0,0,0,0,2,1,2,1,2,1,2,1,2,1,2,1,0,0,0,0],
            [0,0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0,0],
            [0,0,0,0,0,2,1,2,1,2,1,2,1,2,1,0,0,0,0,0]]).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  BOARD PRINTING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

translateChar(3, '|').
translateChar(2, '\\').
translateChar(1, '/').
translateChar(0, ' ').

printLine([]).
printLine([H|T]):-
    translateChar(H, Elem),
    write(Elem),
    printLine(T).

printBoard([]).
printBoard([T|H]):-
    printLine(T),
    nl,
    printBoard(H).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  GAMEPLAY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

start(B):-
    emptyBoard(B),
    printBoard(B).
>>>>>>> origin/master:Code/boardAscii.pl
