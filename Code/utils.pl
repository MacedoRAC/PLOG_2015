createEmptyList([]).

printlist([]).
printlist([X|List]) :-
	write(X),nl,
	printlist(List).

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