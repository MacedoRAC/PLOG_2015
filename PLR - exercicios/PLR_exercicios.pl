:-use_module(library(clpfd)).

% PLS 5 - Fila de Carros
fila:-
	Cor = [Am, Ver, Az, Pr],
	Tam = [Nano, Mini, Micro, Peq],
	domain(Cor, 1, 4), all_distinct(Cor),
	domain(Tam, 1, 4), all_distinct(Tam),
	AntesAzul #= Az-1,
	DepoisAzul #= Az+1,
	element(TamAntesAzul, Tam, AntesAzul),
	element(TamDepoisAzul, Tam, DepoisAzul),
	TamAntesAzul #< TamDepoisAzul,
	Ver #= Nano,
	Ver #> Az,
	Am #> Pr,
	append(Cor, Tam, Vars),
	labeling([], Vars),
	write(Vars).


% Fila 12 carros
% 4 Amarelos
% 2 Verdes
% 3 Vernelhos
% 3 Azuis
% Cor 1º == Cor último
% Cor 2º == Cor Penúltimo
% 5º é Azul
% Cada sequencia de 3 carros têm cores diferentes
% Seq Am-Vd-Vm-Az só aparece 1 vez
%
% Posição na lista L é posição na fila
% Valor é Cor
% Az-1, Am-2, Vd-3, Vm-4	
tres([_, _]).
tres([H1,H2,H3|T]):-
	all_distinct([H1,H2,H3]),
	tres([H2,H3|T]).

quatro([_, _, _], 0).
quatro([H1, H2, H3, H4|T], N):-
	(H1#=2 #/\ H2#=3 #/\ H3#=4 #/\ H4#=1) #<=> Existe,
	quatro([H2, H3, H4|T], N2),
	N #= N2+Existe.

fila2:-
	length(L, 12),
	domain(L, 1, 4),
	global_cardinality(L, [1-3, 2-4, 3-2, 4-3]),
	element(1, L, First),
	element(12, L, Last),
	First #= Last,
	element(2, L, Second),
	element(11, L, OneBeforeLast),
	Second #= OneBeforeLast,
	element(5, L, 1),
	tres(L),
	quatro(L, 1),
	labeling([], L),
	write(L).
