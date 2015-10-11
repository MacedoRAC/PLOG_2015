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

drawEmptySpaces(NoS):- %NoS -> number of empty spaces to draw
    NoS =\= 0,
    write(' '),
    NoS2 is NoS - 1,
    drawEmptySpaces(NoS2).
drawEmptySpaces(_).

drawUpVertexs(NoV):- %NoV -> number of Vertexs (/\) to draw
    NoV =\= 0,
    write('/'), write('\\'),
    NoV2 is NoV -1,
    drawUpVertexs(NoV2).
drawUpVertexs(_).

drawDownVertexs(NoV):- %NoV -> number of Vertexs (\/) to draw
    NoV =\= 0,
    write('\\'), write('/'),
    NoV2 is NoV -1,
    drawDownVertexs(NoV2).
drawDownVertexs(_).

drawBorders(1):-
    drawEmptySpaces(5),
    drawUpVertexs(5),
    nl.
drawBorders(2):-
    drawEmptySpaces(4),
    drawUpVertexs(6),
    nl.
drawBorders(3):-
    drawEmptySpaces(3),
    drawUpVertexs(7),
    nl.
drawBorders(4):-
    drawEmptySpaces(2),
    drawUpVertexs(8),
    nl.
drawBorders(5):-
    drawEmptySpaces(1),
    drawUpVertexs(9),
    nl.
drawBorders(6):-
    drawEmptySpaces(1),
    drawDownVertexs(9),
    nl.
drawBorders(7):-
    drawEmptySpaces(2),
    drawDownVertexs(8),
    nl.
drawBorders(8):-
    drawEmptySpaces(3),
    drawDownVertexs(7),
    nl.
drawBorders(9):-
    drawEmptySpaces(4),
    drawDownVertexs(6),
    nl.
drawBorders(10):-
    drawEmptySpaces(5),
    drawDownVertexs(5),
    nl.

drawSpaces(3):-
    drawEmptySpaces(4).
drawSpaces(4):-
    drawEmptySpaces(3).
drawSpaces(5):-
    drawEmptySpaces(2).
drawSpaces(6):-
    drawEmptySpaces(1).
drawSpaces(7):-
    drawEmptySpaces(2).
drawSpaces(8):-
    drawEmptySpaces(3).
drawSpaces(9):-
    drawEmptySpaces(4).
drawSpaces(10):-
    drawEmptySpaces(5).


printLine([]):-
    write('|').
printLine([H|T]):-
    translateChar(H, Elem),
    write('|'),
    write(Elem),
    printLine(T).


printBoard(_,[]).
printBoard(X,[H|T]):-
    drawSpaces(X),
    printLine(H),
    nl,
    drawBorders(X),
    X2 is X + 1,
    printBoard(X2,T).
printBoard([]).
printBoard([H|T]):-
    drawBorders(1),
    drawEmptySpaces(5),
    printLine(H),
    nl,
    drawBorders(2),
    printBoard(3,T).
