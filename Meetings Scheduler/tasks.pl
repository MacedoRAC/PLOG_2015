/**
		Task	Dur		Rec
		1		16		2
		2		6		9
		3		13		3
		4		7		7
		5		5		10
		6		18		1
		7		4		11
___________________________
Limite					13
*/
:-use_module(library(clpfd)).
:-use_module(library(lists)).


tarefas:-
	T=[task(01,16,E1,2,1),
		task(02,6,E2,9,2),
		task(03,13,E3,3,3),
		task(04,7,E4,7,4),
		task(05,5,E5,10,5),
		task(06,18,E6,1,6),
		task(07,4,E7,11,7)],
	domain([01,02,03,04,05,06,07],1,50),
	E=[E1,E2,E3,E4,E5,E6,E7],
	domain(E,1,70),
	cumulative(T,[limit(13)]),
	maximum(Max,E),
	append(E,[01,02,03,04,05,06,07,Max],All),
	labeling([minimize(Max)],All).
