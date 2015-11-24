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
	R2 is Row-1,
	C2 is C-1,
	checkInRow(Board, R2, 0, C2). 
checkMiddleCell(Board, Row, Column):- %top right cell
	R2 is Row-1,
	checkInRow(Board, R2, 0, Column). 
checkMiddleCell(Board, Row, Column):- %right cell
	C2 is C+1,
	checkInRow(Board, Row, 0, C2). 
checkMiddleCell(Board, Row, Column):- %bottom right cell
	R2 is Row+1,
	C2 is C+1,
	checkInRow(Board, R2, 0, C2). 
checkMiddleCell(Board, Row, Column):- %bottom left cell
	R2 is Row+1,
	checkInRow(Board, R2, 0, Column). 
checkMiddleCell(Board, Row, Column):- %left cell
	C2 is C-1,
	checkInRow(Board, Row, 0, C2). 


%===============CORNER CHECK RUELS=================
isCorner(R, C, CornerNumber):-
	R = 0,
	C = 0,
	CornerNumber is 1.
isCorner(R, C, CornerNumber):-
	R = 0,
	C = 4,
	CornerNumber is 2.
isCorner(R, C, CornerNumber):-
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
	R = 1,
	C = 5,
	SideNumber is 2.
isSide(R, C, SideNumber):-
	R = 2,
	C = 6,
	SideNumber is 2.
isSide(R, C, SideNumber):-
	R = 3,
	C = 7,
	SideNumber is 2.
% Side 6 
isSide(R, C, SideNumber):-
	C = 0,
	R < 4,
	R > 0,
	SideNumber is 6.
isSide(_, _, SideNumber):-
	fail.

% Side 1 (R, Index, C)
checkSide(Board, 1, R, C):-
	C2 is C+1,
	checkInRow(Board, R, 0, C2). %right cell
checkSide(Board, 1, R, C):-
	C2 is C-1,
	checkInRow(Board, R, 0, C2). %left cell
checkSide(Board, 1, R, C):-
	R2 is R+1,
	C2 is C+1,
	checkInRow(Board, R2, 0, C2). %bottom right cell
checkSide(Board, 1, R, C):-
	R2 is R+1,
	checkInRow(Board, R2, 0, C). %bottom left cell
% Side 2
checkSide(Board, 2, R, C):-
	R2 is R-1,
	checkInRow(Board, R2, 0, C2). %top cell
checkSide(Board, 2, R, C):-	
	C2 is C-1,
	checkInRow(Board, R, 0, C2). %top left cell
checkSide(Board, 2, R, C):-
	R2 is R+1,
	checkInRow(Board, R2, 0, C). %left cell
checkSide(Board, 2, R, C):-
	R2 is R+1,
	C2 is C+1,
	checkInRow(Board, R2, 0, C2). %bottom cell
% Side 6
checkSide(Board, 6, R, C):-
	R2 is R-1,
	checkInRow(Board, R2, 0, C). %top cell
checkSide(Board, 6, R, C):-
	C2 is C+1,
	checkInRow(Board, R, 0, C2). %right cell
checkSide(Board, 6, R, C):-
	R2 is R+1,
	C2 is C+1,
	checkInRow(Board, R2, 0, C2). %bottom right cell
checkSide(Board, 6, R, C):-
	R2 is R+1,
	checkInRow(Board, R2, 0, C). %bottom left cell


%===============ADD PIECE=================
checkAdjacentCells(Board, Row, Column):-
	isCorner(Row, Column, CornerNumber),
	checkCorner(Board, ConerNumber).
checkAdjacentCells(Board, Row, Column):-
	isSide(Row, Column, BorderNumber),
	checkSide(Board, BorderNumber, Row, Column).
checkAdjacentCells(Board, Row, Column):- %most comon case
	checkMiddleCell(Board, Row, Column).

setCell(Color, Column, Index, [], NewRow,FinalRow):-
	append([], NewRow, FinalRow). 
setCell(Color, Column, Index, [H|T], NewRow,FinalRow):-
	Column = Index,
	append(NewRow, [Color], NewRow2),
	Index2 is Index+1,
	setCell(Color, Column, Index2, T, NewRow2,FinalRow).
setCell(Color, Column, Index, [H|T], NewRow,FinalRow):-
	append(NewRow, [H], NewRow2),
	Index2 is Index+1,
	setCell(Color, Column, Index2, T, NewRow2,FinalRow).

addPieceToBoard([], Color, Row, Column, Index, NewBoard, FinalBoard):-
	append([], NewBoard, FinalBoard),
	printBoard(FinalBoard).
addPieceToBoard([H|T], Color, Row, Column, Index, NewBoard, FinalBoard):-
	Row = Index,
	createEmptyList(NewRow),
	setCell(Color, Column, 0, H, NewRow,FinalRow),
	append(NewBoard, [FinalRow], NewBoard2),
	Index2 is Index + 1,
	addPieceToBoard(T, Color, Row, Column, Index2, NewBoard2, FinalBoard).
addPieceToBoard([H|T], Color, Row, Column, Index, NewBoard, FinalBoard):-
	append(NewBoard, [H], NewBoard2),
	Index2 is Index + 1,
	addPieceToBoard(T, Color, Row, Column, Index2, NewBoard2, FinalBoard).

%===============CHECK IF PIECE PLACEMENT IS VALID=================
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	emptyCell(BoardState, Row, Column, C),
	Row = 4, !,
	Column = 8, !,
	checkCorner(BoardState, 3),
	addPieceToBoard(BoardState, Color, Row, Column, 0, [], FinalBoard).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	emptyCell(BoardState, Row, Column, C),
	Row = 4, !,
	Column = 0, !,
	checkCorner(BoardState, 6),
	addPieceToBoard(BoardState, Color, Row, Column, 0, [], FinalBoard).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	emptyCell(BoardState, Row, Column, C),
	Row = 4, !,
	checkMiddleCell(BoardState ,Row, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, [], FinalBoard).
tryToAddPieceToBoard(BoardState, Color, Row, Column):-
	emptyCell(BoardState, Row, Column, C),
	Row < 4, !,
	checkAdjacentCells(BoardState ,Row, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, [], FinalBoard).
tryToAddPieceToBoard(BoardState,Color, Row, Column):-
	emptyCell(BoardState, Row, Column, C),
	Row > 4, !,
	RevRow is 8 - Row,
	reverse(BoardState, ReversedBoard),
	checkAdjacentCells(ReversedBoard ,RevRow, Column),
	addPieceToBoard(BoardState, Color, Row, Column, 0, [], FinalBoard).


%===============MOVE PIECE=================
	
tryToMovePiece(BoardState, Color, RowSource, ColumnSource, NumbOfSpaces, Orientation, Board):-
	NumbOfSpaces =< 0,
	append([], Board, BoardState).
tryToMovePiece(BoardState, Color, RowSource, ColumnSource, NumbOfSpaces, Orientation, Board):-
	RowSource = 4, 
	Orientation = 1,
	NewRowSource is RowSource + 1,
	NewColumnSource is ColumnSource - 1,
	reverse(BoardState, ReversedBoardState),
	emptyCell(ReversedBoardState, NewRowSource, NewColumnSource, C),
	addPieceToBoard(ReversedBoardState, Color, NewRowSource, NewColumnSource, 0, [], FinalBoard),
	addPieceToBoard(FinalBoard,0, RowSource, ColumnSource, 0, [], FinalBoard2),
	reverse(FinalBoard2, FinalBoard2Reversed),
	NewNumbOfSpaces is NumbOfSpaces - 1,
	Row is 8 - NewRowSource,
	tryToMovePiece(FinalBoard2Reversed, Color, Row, NewColumnSource, NewNumbOfSpaces, Orientation, Board).
tryToMovePiece(BoardState, Color, RowSource, ColumnSource, NumbOfSpaces, Orientation, Board):-
	RowSource = 4,
	Orientation = 2,
	NewRowSource is RowSource + 1,
	reverse(BoardState, ReversedBoardState),
	emptyCell(ReversedBoardState, NewRowSource, ColumnSource, C),
	addPieceToBoard(ReversedBoardState, Color, NewRowSource, ColumnSource, 0, [], FinalBoard),
	addPieceToBoard(FinalBoard,0, RowSource, ColumnSource, 0, [], FinalBoard2),
	reverse(FinalBoard2, FinalBoard2Reversed),
	NewNumbOfSpaces is NumbOfSpaces - 1,
	Row is 8 - NewRowSource,
	tryToMovePiece(FinalBoard2Reversed, Color, Row, NewColumnSource, NewNumbOfSpaces, Orientation, Board).
tryToMovePiece(BoardState, Color, RowSource, ColumnSource, NumbOfSpaces, Orientation, Board):-
	RowSource < 4,
	convertOrientation(RowSource, Orientation, Xinc, Yinc),
	NewRowSourceTemp is 8 - RowSource,
	NewRowSource is NewRowSourceTemp + Yinc,
	NewColumnSource is ColumnSource + Xinc,
	reverse(BoardState, ReversedBoardState),
	emptyCell(ReversedBoardState, NewRowSource, NewColumnSource, C),
	addPieceToBoard(ReversedBoardState, Color, NewRowSource, NewColumnSource, 0, [], FinalBoard),
	addPieceToBoard(FinalBoard,0, NewRowSourceTemp, ColumnSource, 0, [], FinalBoard2),
	reverse(FinalBoard2, FinalBoard2Reversed),
	NewNumbOfSpaces is NumbOfSpaces - 1,
	Row is 8 - NewRowSource,
	tryToMovePiece(FinalBoard2Reversed, Color, Row, NewColumnSource, NewNumbOfSpaces, Orientation, Board).
tryToMovePiece(BoardState, Color, RowSource, ColumnSource, NumbOfSpaces, Orientation, Board):-
	RowSource >= 4,
	convertOrientation(RowSource, Orientation, Xinc, Yinc),
	NewRowSource is RowSource + Yinc,
	NewColumnSource is ColumnSource + Xinc,
	emptyCell(BoardState, NewRowSource, NewColumnSource, C),
	addPieceToBoard(BoardState, Color, NewRowSource, NewColumnSource, 0, [], FinalBoard),
	addPieceToBoard(FinalBoard,0, RowSource, ColumnSource, 0, [], FinalBoard2),
	NewNumbOfSpaces is NumbOfSpaces - 1,
	tryToMovePiece(FinalBoard2, Color, NewRowSource, NewColumnSource, NewNumbOfSpaces, Orientation, Board).

move(BoardState, RowSource, ColumnSource, Moves, Orientation, OK):-
	printBoard(BoardState),
	getPiece(BoardState, RowSource, ColumnSource, Color),
	tryToMovePiece(BoardState, Color, RowSource, ColumnSource, Moves, Orientation, Board),
	printBoard(Board).

%===============CHECK IF GAME ENDED=================
