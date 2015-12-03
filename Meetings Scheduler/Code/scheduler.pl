:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- [database].

%variables
%working shedule
schedule:-
	length(Part, 12),
	length(Meetings, 3),
	length(Salas, 6),
	length(Time, 9),

	domain(Part, 1, 12), all_distinct(Part),
	domain(Meetings, 1, 3), all_distinct(Meetings),
	domain(Salas, 1, 6), all_distinct(Salas),
	domain(Time, 1, 9), all_distinct(TIme),

	duration(meeting(Meetings), Dur),
	(Time + Dur) #< 9,
	global_cardinality(Time, [])