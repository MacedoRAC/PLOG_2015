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

%Metting(name, duration)
meeting(thesis_presentation).
meeting(company_meeting).
meeting(chairman_election).

%Meetings duration
duration(thesis_presentation,1).
duration(company_meeting,1).
duration(chairman_election,3).


%obligatory and optional presences
obligatory(participantID(12), meeting(thesis_presentation)).
obligatory(participantID(3), meeting(thesis_presentation)).
obligatory(participantID(5), meeting(thesis_presentation)).
optional(participantID(1), meeting(thesis_presentation)).
optional(participantID(2), meeting(thesis_presentation)).
obligatory(participantID(10), meeting(company_meeting)).
obligatory(participantID(3), meeting(company_meeting)).
optional(participantID(5), meeting(company_meeting)).
obligatory(participantID(1), meeting(chairman_election)).
obligatory(participantID(2), meeting(chairman_election)).
obligatory(participantID(3), meeting(chairman_election)).
optional(participantID(4), meeting(chairman_election)).
optional(participantID(5), meeting(chairman_election)).
optional(participantID(6), meeting(chairman_election)).

%Placement
place(thesis_presentation,auditorium).
place(company_meeting,normal).
place(chairman_election,auditorium).

%Salas(Numero, Tipo) -> Regular=normal, Auditorium=tem projetor, Conference Room=videoconferencia
sala(1,normal).
sala(2,normal).
sala(3,normal).
sala(4,conference_room).
sala(5,conference_room).
sala(6,auditorium).
