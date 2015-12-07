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
	find_all(participantID(_), ParticipantsSize),
	find_all(sala(_,_,_), SalasSize),

	domain(Meetings, 1, ListsSize), all_distinct(Meetings),
	domain(Participants, 1, ParticipantsSize), all_distinct(Participants),
	domain(Time, 1, 8),
	domain(Salas, 1, SalasSize),


	duration(meeting(Meetings), Dur),
	(Time + Dur) #< 9,
	