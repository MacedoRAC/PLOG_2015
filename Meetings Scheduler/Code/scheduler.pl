:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- [database].

%variables
%working shedule
schedule:-
	find_all(meeting(_), ListsSize), 
	length(Meetings, ListsSize),
	length(Time, ListsSize),
	length(Salas, ListsSize),
	%faltam os participantes aqui

	domain(Meetings, 1, ListsSize), all_distinct(Meetings),
	domain(Time, 1, 8),
	find_all(sala(_,_,_), SalasSize),
	domain(Salas, 1, SalasSize),


	duration(meeting(Meetings), Dur),
	(Time + Dur) #< 9,