:- use_module(library(lists)).
:- use_module(library(clpfd)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ADD PIECE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

checkInRow([H|T], Row, Index, Column):-
	Row = Index,
	nth0(Column, H, 0).
checkInRow([H|T], Row, Index, Column):-
	Index2 is Index+1,
	checkInRow(T, Row, Index2, Column).


checkMiddleCell(Board, Row, Column):- %top left cell
	checkInRow(Board, Row-1, 0, Column-1). 
checkMiddleCell(Board, Row, Column):- %top right cell
	checkInRow(Board, Row-1, 0, Column). 
checkMiddleCell(Board, Row, Column):- %right cell
	checkInRow(Board, Row, 0, Column+1). 
checkMiddleCell(Board, Row, Column):- %bottom right cell
	checkInRow(Board, Row+1, 0, Column+1). 
checkMiddleCell(Board, Row, Column):- %bottom left cell
	checkInRow(Board, Row+1, 0, Column). 
checkMiddleCell(Board, Row, Column):- %left cell
	checkInRow(Board, Row, 0, Column-1). 



%===============CORNER CHECK RUELS=================
isCorner(R, C, CornerNumber):-
	R = 0, !,
	C = 0,
	CornerNumber is 1.
isCorner(R, C, CornerNumber):-
	R = 0, !,
	C = 4,
	CornerNumber is 2.
isCorner(_, _, CornerNumber):-
	fail.

checkCorner(Board, 1):-
	checkInRow(Board, 0, 0, 1). %right cell
checkCorner(Board, 1):-
	checkInRow(Board, 1, 0, 0). %bottom left cell
checkCorner(Board, 1):-
	checkInRow(Board, 1, 0, 1). %bottom right cell
checkCorner(Board, 2):-
	checkInRow(Board, 0, 0, 3). %left cell
checkCorner(Board, 2):-
	checkInRow(Board, 1, 0, 4). %bottom left cell
checkCorner(Board, 2):-
	checkInRow(Board, 1, 0, 5). %bottom right cell
checkCorner(Board, 3):-
	checkInRow(Board, 4, 0, 7). %left cell
checkCorner(Board, 3):-
	checkInRow(Board, 3, 0, 7). %top left cell
checkCorner(Board, 3):-
	checkInRow(Board, 5, 0, 7). %bottom left cell
checkCorner(Board, 6):-
	checkInRow(Board, 4, 0, 1). %right cell
checkCorner(Board, 6):-
	checkInRow(Board, 3, 0, 0). %bottom left cell
checkCorner(Board, 6):-
	checkInRow(Board, 5, 0, 0). %bottom right cell




%===============SIDE CHECK RULES=================
% Side 1 
isSide(R, C, SideNumber):-
	R = 0,
	SideNumber is 1.
% Side 2 
isSide(R, C, SideNumber):-
	R = 1, !,
	C = 5,
	SideNumber is 2.
isSide(R, C, SideNumber):-
	R = 2, !,
	C = 6,
	SideNumber is 2.
isSide(R, C, SideNumber):-
	R = 3, !,
	C = 7,
	SideNumber is 2.
% Side 6 
isSide(R, C, SideNumber):-
	C = 0, !,
	R < 4, !,
	R > 0,
	SideNumber is 6.
isSide(_, _, SideNumber):-
	fail.

% Side 1 (R, Index, C)
checkSide(Board, 1, R, C):-
	checkInRow(Board, R, 0, C+1). %right cell
checkSide(Board, 1, R, C):-
	checkInRow(Board, R, 0, C-1). %left cell
checkSide(Board, 1, R, C):-
	checkInRow(Board, R+1, 0, C+1). %bottom right cell
checkSide(Board, 1, R, C):-
	checkInRow(Board, R+1, 0, C). %bottom left cell
% Side 2
checkSide(Board, 2, R, C):-
	checkInRow(Board, R-1, 0, C-1). %top cell
checkSide(Board, 2, R, C):-
	checkInRow(Board, R, 0, C-1). %top left cell
checkSide(Board, 2, R, C):-
	checkInRow(Board, R+1, 0, C). %left cell
checkSide(Board, 2, R, C):-
	checkInRow(Board, R+1, 0, C+1). %bottom cell
% Side 6
checkSide(Board, 6, R, C):-
	checkInRow(Board, R-1, 0, C). %top cell
checkSide(Board, 6, R, C):-
	checkInRow(Board, R, 0, C+1). %right cell
checkSide(Board, 6, R, C):-
	checkInRow(Board, R+1, 0, C+1). %bottom right cell
checkSide(Board, 6, R, C):-
	checkInRow(Board, R+1, 0, C). %bottom left cell



%===============ADD PIECE=================


checkAdjacentCells(Board, Row, Column):-
	isCorner(Row, Column, CornerNumber),
	checkCorner(Board, ConerNumber).
checkAdjacentCells(Board, Row, Column):-
	isSide(Row, Column, BorderNumber),
	checkSide(Board, BorderNumber, Row, Column).
checkAdjacentCells(Board, Row, Column):- %most comon case
	checkMiddleCell(Board, Row, Column).


setCell(Color, Column, Index, [H|T], NewRow):-
	Column = Index,
	append(NewRow, Color, NewRow2),
	Index2 is Index + 1,
	setCell(Color, _, Index2, T, NewRow2).
setCell(Color, Column, Index, [H|T], NewRow):-
	Column = Index,
	append(NewRow, H, NewRow2),
	Index2 is Index + 1,
	setCell(Color, _, Index2, T, NewRow2).
setCell(_, _, _, [], NewRow).


addPieceToBoard([H|T], Color, Row, Column, Index, NewBoard):-
	Row = Index,
	NewRow is [],
	setCell(Color, Column, 0, H, NewRow),
	append(NewBoard, NewRow, NewBoard2),
	Index2 is Index + 1,
	addPieceToBoard(T, Color, Row, _, Index2, NewBoard2).
addPieceToBoard([H|T], Color, Row, _, Index, NewBoard):-
	Row = Index,
	append(NewBoard, H, NewBoard2),
	Index2 is Index + 1,
	addPieceToBoard(T, Color, Row, _, Index2, NewBoard2).
addPieceToBoard([], _, _, _, _, NewBoard):-
	BoardState is NewBoard.


tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	Row = 4, !,
	Column = 8, !,
	checkCorner(BoardState, 3),
	addPieceToBoard(BoardState, Color, Row, Column, 0, []).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	Row = 4, !,
	Column = 0, !,
	checkCorner(BoardState, 6),
	addPieceToBoard(BoardState, Color, Row, Column, 0, []).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	Row = 4, !,
	checkMiddleCell(BoardState ,Row, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, []).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	Row < 4, !,
	checkAdjacentCells(BoardState ,Row, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, []).
tryToAddPieceToBoard(BoardState,	 Color, Row, Column):-
	Row > 4, !,
	RevRow is 8 - Row,
	reverse(BoardState, ReversedBoard),
	checkAdjacentCells(ReversedBoard ,RevRow, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, []).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MOVE PIECE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



tryToMovePiece(BoardState, Color, RowSource, ColumnSource, RowDest, ColumnDest):-
	checkInRow(BoardState, RowDest, 0, ColumnDest), %check cell availability
	checkPiecesInTheMiddle(RowSource, ColumnSource, RowDest, ColumnDest),
	movePiece(Color, RowSource, ColumnSource, RowDest, ColumnDest).