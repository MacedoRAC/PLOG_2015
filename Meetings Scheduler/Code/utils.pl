%%%%%%%%%%%%UTILS%%%%%%%%%%%%%%
getMaxValue(R_ids,Value) :- 
	maximum(Value,R_ids).

getTotalSize([],0).
getTotalSize([Sala1|T],Size) :- 
	getTotalSize(T,TSize),
	element(2,Sala1,X),
	X1 #= X + 1,
	Size #= X1 + TSize.
	
	
	
count_equals(_,[],0).
count_equals(V,[H|T],C) :- 
	count_equals(V,T,C1),
	(H #= V) #<=> C2,
	C #= C1 + C2.

flatten(List, FlatList) :-
 flatten(List, [], FlatList0), !,
 FlatList = FlatList0.

 flatten(Var, Tl, [Var|Tl]) :- var(Var), !.
 flatten([], Tl, Tl) :- !.
 flatten([Hd|Tl], Tail, List) :- !,
     flatten(Hd, FlatHeadTail, List),
     flatten(Tl, Tail, FlatHeadTail).
flatten(NonList, Tl, [NonList|Tl]).