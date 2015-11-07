createEmptyList([]).

printlist([]).
printlist([X|List]) :-
	write(X),nl,
	printlist(List).

emptyCell(Board, Row, Collum, Color):-
	getPiece(Board, Row, Collumn, Color),
	not(Color = 0).

% se Orientation == 1 (top-left) => X = constante && Y -= 1
% se Orientation == 2 (top-right) => X += 1 && Y -= 1
% se Orientation == 3 (right) => X += 1 && Y += 0
% se Orientation == 4 (botom-right) => X = constante && Y += 1
% se Orientation == 5 (bottom-left) => X -= 1 && Y += 1
% se Orientation == 6 (left) => X -= 1 && X += 0


convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 1,
	Xinc is 0,
	Yinc is -1.
convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 2,
	Xinc is 1,
	Yinc is -1.
convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 3,
	Xinc is 1,
	Yinc is 0.
convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 4,
	Xinc is 0,
	Yinc is 1.
convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 5,
	Xinc is -1,
	Yinc is 1.
convertOrientation(Orientation, Xinc, Yinc):-
	Orientation = 6,
	Xinc is -1,
	Yinc is 1.

getPlayerName([H|T], Index, PlayerActive, Name):-
	Index = PlayerActive,
	nth0(0, H, Name).
getPlayerName([H|T], Index, PlayerActive, Name):-
	Index2 is Index + 1,
	getPlayerName(T, Index2, PlayerActive, Name).

%===============GET FUNCTIONS=================

getRow([H|T], Row, Column, Color, Index):-
	Index = Row,
	nth0(Column,H,Color).
getRow([H|T], Row, Column, Color, Index):-
	Index < Row,
	Index2 is Index + 1,
	getRow(T, Row, Column, Color, Index2).

getPiece(Board, Row, Column, Color):-
	getRow(Board, Row, Column, Color, 0).

