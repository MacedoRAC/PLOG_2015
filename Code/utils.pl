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


convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 1,
	Xinc is 0,
	Yinc is 1,
	Zinc is -1.
convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 4,
	Xinc is 0,
	Yinc is -1,
	Zinc is 1.
convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 2,
	Xinc is 1,
	Yinc is 0,
	Zinc is -1.
convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 5,
	Xinc is -1,
	Yinc is 0,
	Zinc is 1.
convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 3,
	Xinc is 1,
	Yinc is -1,
	Zinc is 0.
convertOrientation(Orientation, Xinc, Yinc, Zinc):-
	Orientation = 6,
	Xinc is 0,
	Yinc is 1,
	Zinc is -1.