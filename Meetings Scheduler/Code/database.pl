%%%%%%%%%%%%%%%%%%%%%%% DATABASE %%%%%%%%%%%%%%%%%%%%%%% 
%Participants ID
participantID(1).
participantID(2).
participantID(3).
participantID(4).
participantID(5).
participantID(6).
participantID(7).
participantID(8).
participantID(9).
participantID(10).
participantID(11).
participantID(12).

%Meeting(name, duration, obligatory participants, optional participants)
meeting(thesis_presentation,1,[12,3,5],[1]).
meeting(company_meeting,1,[10,3],[5]).
meeting(chairman_election,3,[1,2,3],[4,5,6]).

%Placement(meeting, type)
place(meeting(thesis_presentation), auditorium).
place(meeting(company_meeting), normal).
place(meeting(chairman_election), auditorium).

%Salas(id, type, capacidade) -> Regular=normal, Auditorium=tem projetor, Conference Room=videoconferencia
sala(1,normal, 5).
sala(2,normal, 5).
sala(3,normal, 5).
sala(4,conference_room, 10).
sala(5,conference_room, 10).
sala(6,auditorium, 15).
