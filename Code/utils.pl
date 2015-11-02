createEmptyList([]).

printlist([]).
printlist([X|List]) :-
	write(X),nl,
	printlist(List).

copy(L,R) :- accCp(L,R).

accCp([],[]).
accCp([H|T1],[H|T2]) :- 
	accCp(T1,T2).

convertToInt(Char):-
	integer(Char),
	write('DONE').
convertToInt(Char):-
	Char = '1',
	convertToInt(1).
convertToInt(Char):-
	Char = '2',
	convertToInt(2).
convertToInt(Char):-
	Char = '3',
	convertToInt(3).
convertToInt(Char):-
	Char = '4',
	convertToInt(4).
