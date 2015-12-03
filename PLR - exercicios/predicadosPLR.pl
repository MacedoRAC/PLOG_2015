%%%%  PLR  %%%%

element(Index, List, Value). %pode retornar o Index se Value ou vice-versa

global_cardinality(List, Values). %Values é do tipo [Key-Value, Key2-Value], isto é Key repete-se exatamente Value vezes

sum(List, RelOp, Value). %RelOp pode ser #=, #<, etc. somatorio dos elementos de List têm que ser RelOp que Value

count(Val, List, RelOp, Count). %numero de vezes que Val aparece na lista e verificar se esse numero de vezes RelOp que Count



% Restrições Materializáveis

Restricao #<=> Valor. %se restricao verdadeira Valor é 1 senão é 0

%exemplo - contar numero de elementos iguais numa lista
count_equals([], _, 0).
count_equals([H|T], Val, Count):-
	H #= Val #<=> A,
	count_equals(T, Val, C2),
	Count #= C2+A.