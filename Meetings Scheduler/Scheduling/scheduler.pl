:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- [database].
:- [utils].



schedule:-
	findall(Room, room(RoomID, RoomsType, RoomsCap), Rooms),
	findall(Meeting, meeting(_, _, _, _), MeetingsInDB),
	length(MeetingsInDB,NumberOfMeetings),
	length(SS,NumberOfMeetings),
	length(ES,NumberOfMeetings),
	createDuration(MeetingsInDB,D),
	createTasks(SS,D,ES,Rooms,MeetingTasks),
	
	assign_rooms(Rooms,MeetingsInDB,RoomsCap-RoomsType),
	assigne_participans_meeting(Meetings,MeetingsInDB,RoomsForMeetings,RoomsCap,NumbOfOptionals),
	cumulatives(MeetingTasks,Meetings,[bound(upper)]),

	labeling([maximize(NumbOfOptionals)],Vars).
	

assign_rooms(_,[],_).
assign_rooms([Hrooms|Trooms], RoomsCap-RoomsType). %TODO

	
assigne_participans_meeting(_,[],[],_,0).	
assigne_participans_meeting([Hmeetings|Tmeetings],RoomCap). %TODO
