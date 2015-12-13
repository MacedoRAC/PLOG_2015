
:-use_module(library(lists)).

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

%Meeting(name, [obrigatoryParticipants], duration)
meeting(thesis_presentation, [12, 3, 5], 1).
meeting(company_meeting, [10, 3], 1).
meeting(chairman_election, [1, 2, 3], 3).

%Meetings duration
/*duration(meeting(thesis_presentation), 1).
duration(meeting(company_meeting), 1).
duration(meeting(chairman_election), 3).*/


%obligatory and optional presences (idParticipante, meeting)
/*obligatory(12, thesis_presentation).
obligatory(3, thesis_presentation).
obligatory(5, thesis_presentation).
obligatory(10, company_meeting).
obligatory(3, company_meeting).
obligatory(1, chairman_election).
obligatory(2, chairman_election).
obligatory(3, chairman_election).*/
optional(1, thesis_presentation).
optional(2, thesis_presentation).
optional(5, company_meeting).
optional(4, chairman_election).
optional(5, chairman_election).
optional(6, chairman_election).

%Placement
place(meeting(thesis_presentation), auditorium).
place(meeting(company_meeting), normal).
place(meeting(chairman_election), auditorium).

%Salas(Numero, Tipo, capacidade) -> Regular=normal, Auditorium=tem projetor, Conference Room=videoconferencia
sala(1,normal, 5).
sala(2,normal, 5).
sala(3,normal, 5).
sala(4,conference_room, 10).
sala(5,conference_room, 10).
sala(6,auditorium, 15).