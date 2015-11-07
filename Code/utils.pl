createEmptyList([]).

printlist([]).
printlist([X|List]) :-
	write(X),nl,
	printlist(List).

% se Orientation == 1 (top-left) => X = constante && Y += 1 && Z -= 1
% se Orientation == 4 (botom-right) => X = constante && Y -= 1 && Z += 1
% se Orientation == 2 (top-right) => Y = constante && X += 1 && Z -= 1
% se Orientation == 5 (bottom-left) => Y = constante && X -= 1 && Z += 1
% se Orientation == 3 (right) => Z = constante && X += 1 && Y -= 1
% se Orientation == 6 (left) => Z = constante && X -= 1 && Y += 1


%top left -> bottom left
convertOrientation(Orientation, Done):-
	Done = 0
	Orientation = 6,
	convertOrientation(4, 1).
%top right -> bottom right
convertOrientation(Orientation, Done):-
	Done = 0
	Orientation = 1,
	convertOrientation(3, 1).
%bottom right-> top right
convertOrientation(Orientation, Done):-
	Done = 0
	Orientation = 3,
	convertOrientation(1, 1).
%bottom left -> top left
convertOrientation(Orientation, Done):-
	Done = 0
	Orientation = 4,
	convertOrientation(6, 1).
convertOrientation(Orientation, Done):-
	Done = 1.