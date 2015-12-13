:-use_module(library(clpfd)).
:-use_module(library(lists)).
:- [database].
:- [utils].



schedule(SalasCap-SalasCar) :- 
	findall(meeting(_, _, _), _, Meetings)
	length(MeetingsInDB,NumberOfMeetings),
	length(SS,NumberOfMeetings),
	length(ES,NumberOfMeetings),
	length(Rooms,NumberOfMeetings),
	length(Meetings,NumberOfMeetings),
	createDuration(MeetingsInDB,D),
	createTasks(SS,D,ES,SalasReuniao,ReunioesTask),
	createMachines(SalasCap,Machines,1),
	
	
	domain(SS,1,1000),
	domain(D,1,1000),
	domain(ES,1,1000),
	domain(Rooms,1,NumberOfMeetings),
	domain([End],1,1000),
	domain([Evaluation],1,1000),
	maximum(End,ES),
	
	assign_salas_reuniao(Rooms,MeetingsInDB,SalasCap-SalasCar),
	assign_reuniao_participantes(Meetings,MeetingsInDB,Rooms,SalasCap,NumbOfOptionals),
	time_constraint(Meetings,MeetingsInDB,SS,ES),
	
	cumulatives(ReunioesTask,Machines,[bound(upper)]),
	
	Evaluation #= NumbOfOptionals mod End * 10,
	
	append(SS,[End],Vars1),
	append(Vars1,Rooms,Vars2),
	append(Vars2,Meetings,Vars3),
	append(Vars3,[NumbOfOptionals],Vars4),
	append(Vars4,[Evaluation],Vars5),
	
	
	
	flatten(Vars5,Vars),
	
	
	
	labeling([maximize(NumbOfOptionals)],Vars),
	write(SS),nl,write(ES),nl,write(Rooms),nl,write(Meetings),nl,write(MeetingsInDB),nl,write(Evaluation).
	

assign_salas_reuniao(_,[],_).
assign_salas_reuniao([HSalasReuniao|TSalasReuniao],[ [_,MO,MOD,_MP] |TReunioesPretendidas],SalasCap-SalasCar) :- 
	element(I,SalasCar,V),
	element(I,SalasCap,Cap),
	length(MOD,X),
	length(MO,Y),
	Cap in 0..100,
	Y  #=< Cap,
	(V #= 2 #/\ X #> 0) #\/ X #= 0,
	HSalasReuniao #= I,
	assign_salas_reuniao(TSalasReuniao,TReunioesPretendidas,SalasCap-SalasCar).


force_obrigatorios(_HReunioes,[],[],_).
force_obrigatorios(HReunioes,[],[_HMOD|TMOD],Id) :- 
	Id1 is Id + 1,
	element(Id1,HReunioes,1), %força que user HMOD exista na reuniao
	force_obrigatorios(HReunioes,[],TMOD,Id1).
force_obrigatorios(HReunioes,[_HMO|TMO],MOD,Id) :- 
	Id1 is Id + 1,
	element(Id1,HReunioes,1), %força que user HMO exista na reuniao
	force_obrigatorios(HReunioes,TMO,MOD,Id1).




	
assign_reuniao_participantes(_,[],[],_,0).	
assign_reuniao_participantes([HReunioes|TReunioes],[ [_,MO,MOD,MP] |TReunioesPretendidas],[HSR|TSR],SalasCap,TotalOpt) :- 
	length(MO,NumObg),
	length(MOD,NumObgDist),
	length(MP,NumPref),
	
	NumParticipantes is NumObg + NumObgDist + NumPref,
	length(HReunioes,NumParticipantes),
	domain(HReunioes,0,1),

	
	force_obrigatorios(HReunioes,MO,MOD,0),
	
	
	%evita ultrapassar limite da sala
	sum(HReunioes,#=,CountPartipantes),
	CountPartipantesE #= CountPartipantes - NumPref,
	element(HSR,SalasCap,Cap),
	CountPartipantesE #=< Cap,
	
	NumParticipantesObg #= NumObg + NumObgDist,
	length(ListObg,NumParticipantesObg),
	append(ListObg,ListOpt,HReunioes),
	sum(ListOpt,#=,CountOpt1),
	
	assign_reuniao_participantes(TReunioes,TReunioesPretendidas,TSR,SalasCap,CountOpt2),
	
	TotalOpt #= CountOpt1 + CountOpt2.
	
flatten_reunioes_pretendidas([_,MO,MOD,MP],Result) :- 
	append(MO,MOD,R1),
	append(R1,MP,Result).
	

%count = 0 if intercept and 1 if no interception
check_intercept_reunioes(SS1,ES1,SS2,ES2,Count) :- 
	(SS1 #>= ES2) #<=> C1, %Reuniao2 antes de Reuniao1
	(SS2 #>= ES1) #<=> C2, %Reuniao1 antes de Reuniao2
	Count #= C1 + C2.
	

count_equals2(_,_,[],_,0).
count_equals2(V,B,[H1|T1],[H2|T2],C) :- 
	count_equals2(V,B,T1,T2,C1),
	(H1 #= V) #<=> C2,
	C3 #= B * H2 * C2,
	C #= C1 + C3.
	
		
%returns number of same people	
count_equals3([],_,_,_,0).
count_equals3([HV|TV],[HB|TB],RP2,R2,C) :-
	count_equals3(TV,TB,RP2,R2,C1),
	count_equals2(HV,HB,RP2,R2,C2),
	C #= C1 + C2.
	
	

%evita mesmas pessoas em duas reunioes ao mesmo tempo
avoid_same_time(_Reuniao,_ReuniaoPret,_SS,_ES,[],[],[],[]).
avoid_same_time(Reuniao,ReuniaoPret,SS,ES,[HReunioes|TReunioes],[HReunioesPretendidas|TReunioesPretendidas],[HSS|TSS],[HES|TES]) :- 
	check_intercept_reunioes(SS,ES,HSS,HES,C1),
	flatten_reunioes_pretendidas(ReuniaoPret,ReuniaoPret1),
	flatten_reunioes_pretendidas(HReunioesPretendidas,ReuniaoPret2),
	count_equals3(ReuniaoPret1,Reuniao,ReuniaoPret2,HReunioes,C2),
	C1 #= 1 #\/ C2 #= 0,
	avoid_same_time(Reuniao,ReuniaoPret,SS,ES,TReunioes,TReunioesPretendidas,TSS,TES).

time_constraint([],[],[],[]).
time_constraint([HReunioes|TReunioes],[HReunioesPretendidas|TReunioesPretendidas],[HSS|TSS],[HES|TES]) :- 
	avoid_same_time(HReunioes,HReunioesPretendidas,HSS,HES,TReunioes,TReunioesPretendidas,TSS,TES),
	time_constraint(TReunioes,TReunioesPretendidas,TSS,TES).