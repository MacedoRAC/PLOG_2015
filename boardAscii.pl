%    /\/\/\/\/\
%    | | | | | |
%   /\/\/\/\/\/\
%   | | | | | | |
%  /\/\/\/\/\/\/\
%  | | | | | | | |
% /\/\/\/\/\/\/\/\
% | | | | | | | | |
% \/\/\/\/\/\/\/\/
%  | | | | | | | |
%  \/\/\/\/\/\/\/
%   | | | | | | |
%   \/\/\/\/\/\/
%    | | | | | |
%    \/\/\/\/\/


pipe():-
    write("|"). %represented by 3
backslash():-
    write("\"). %represented by 2
slash():-
    write("/"). %represented by 1
whitespace():-
    write(" "). %represented by 0

emptyBoard([[0,0,0,0,1,2,1,2,1,2,1,2,1,2,0,0,0,0],
            [0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0],
            [0,0,0,1,2,1,2,1,2,1,2,1,2,1,2,0,0,0],
            [0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0],
            [0,0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0,0],
            [0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0],
            [0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0],
            [0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3],
            [0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0],
            [0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0],
            [0,0,1,2,1,2,1,2,1,2,1,2,1,2,1,2,0,0],
            [0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,3,0,0],
            [0,0,0,1,2,1,2,1,2,1,2,1,2,1,2,0,0,0],
            [0,0,0,0,3,0,3,0,3,0,3,0,3,0,3,0,0,0],
            [0,0,0,0,1,2,1,2,1,2,1,2,1,2,0,0,0,0]]).

printElem(E):-
    E is 0,
    whitespace().

printElem(E):-
    E is 1,
    slash().

printElem(E):-
    E is 2,
    backslash().

printElem(E):-
    E is 3,
    pipe().

printLine([]).
printLine([H|T]):-
    printElem(H),
    printLine(T),
    nl.

printBoard([T|H]):-
    printLine(T),
    printBoard(H).



start:-
    emptyBoard(B),
    printBoard(B).