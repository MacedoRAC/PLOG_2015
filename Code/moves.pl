tryToAddPieceToBoard(Color, Row, Column):-
	checkAdjacentCells(Row, Column),
	addPieceToBoard(Color, Row, Column).

tryToMovePiece(Color, RowSource, ColumnSource, RowDest, ColumnDest):-
	checkBoardFrontiers(RowDest, ColumnDest),
	checkPiecesInTheMiddle(RowSource, ColumnSource, RowDest, ColumnDest),
	movePiece(Color, RowSource, ColumnSource, RowDest, ColumnDest).