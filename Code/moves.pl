:- use_l

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ADD PIECE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

checkInRow([H|T], Row, Index, Column):-
	Row = Index,
	nth0(Column, H, 0).
checkInRow([H|T], Row, Index, Column):-
	Index2 is Index+1,
	checkInRow(T, Row, Index2, Column).


checkMiddleCell(Row, Column):- %top left cell
	checkInRow(BoardState, Row-1, 0, Column-1). 
checkMiddleCell(Row, Column):- %top right cell
	checkInRow(BoardState, Row-1, 0, Column). 
checkMiddleCell(Row, Column):- %right cell
	checkInRow(BoardState, Row, 0, Column+1). 
checkMiddleCell(Row, Column):- %bottom right cell
	checkInRow(BoardState, Row+1, 0, Column+1). 
checkMiddleCell(Row, Column):- %bottom left cell
	checkInRow(BoardState, Row+1, 0, Column). 
checkMiddleCell(Row, Column):- %left cell
	checkInRow(BoardState, Row, 0, Column-1). 



isCorner(R, C, CornerNumber):-
	R = 0,
	C = 0,
	CornerNumber is 1.
isCorner(R, C, CornerNumber):-
	R = 0,
	C = 4,
	CornerNumber is 2.
isCorner(R, C, CornerNumber):-
	R = 4,
	C = 8,
	CornerNumber is 3.
isCorner(R, C, CornerNumber):-
	R = 8,
	C = 4,
	CornerNumber is 4.
isCorner(R, C, CornerNumber):-
	R = 8,
	C = 0,
	CornerNumber is 5.
isCorner(R, C, CornerNumber):-
	R = 4,
	C = 0,
	CornerNumber is 6.
isCorner(_, _, CornerNumber):-
	fail.

checkCorner(1):-
	checkInRow(BoardState, 0, 0, 1). %right cell
checkCorner(1):-
	checkInRow(BoardState, 1, 0, 0). %bottom left cell
checkCorner(1):-
	checkInRow(BoardState, 1, 0, 1). %bottom right cell
checkCorner(2):-
	checkInRow(BoardState, 0, 0, 3). %left cell
checkCorner(2):-
	checkInRow(BoardState, 1, 0, 4). %bottom left cell
checkCorner(2):-
	checkInRow(BoardState, 1, 0, 5). %bottom right cell
checkCorner(3):-
	checkInRow(BoardState, 4, 0, 7). %left cell
checkCorner(3):-
	checkInRow(BoardState, 3, 0, 7). %top left cell
checkCorner(3):-
	checkInRow(BoardState, 5, 0, 7). %bottom left cell
checkCorner(4):-
	checkInRow(BoardState, 8, 0, 3). %left cell
checkCorner(4):-
	checkInRow(BoardState, 7, 0, 4). %top left cell
checkCorner(4):-
	checkInRow(BoardState, 7, 0, 5). %top right cell
checkCorner(5):-
	checkInRow(BoardState, 8, 0, 1). %right cell
checkCorner(5):-
	checkInRow(BoardState, 7, 0, 0). %top left cell
checkCorner(5):-
	checkInRow(BoardState, 7, 0, 1). %top right cell
checkCorner(6):-
	checkInRow(BoardState, 4, 0, 1). %right cell
checkCorner(6):-
	checkInRow(BoardState, 3, 0, 0). %bottom left cell
checkCorner(6):-
	checkInRow(BoardState, 5, 0, 0). %bottom right cell





%fazer para os restantes cantos



checkAdjacentCells(Row, Column):-
	isCorner(Row, Column, CornerNumber),
	checkCorner(ConerNumber).
checkAdjacentCells(Row, Column):-
	isBorder(Row, Column, BorderNumber),
	checkBorder(BorderNumber, Row, Column).
checkAdjacentCells(Row, Column):- %most comon case
	checkMiddleCell(Row, Column).



tryToAddPieceToBoard(Color, Row, Column):-
	checkAdjacentCells(Row, Column),
	addPieceToBoard(Color, Row, Column).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MOVE PIECE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tryToMovePiece(Color, RowSource, ColumnSource, RowDest, ColumnDest):-
	checkBoardFrontiers(RowDest, ColumnDest),
	checkPiecesInTheMiddle(RowSource, ColumnSource, RowDest, ColumnDest),
	movePiece(Color, RowSource, ColumnSource, RowDest, ColumnDest).