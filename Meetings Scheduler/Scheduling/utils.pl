%%%%%%%%%%%%UTILS%%%%%%%%%%%%%%
getMaxValue(R_ids,Value) :- 
	maximum(Value,R_ids).

getTotalSize([],0).
createTasks([],_,_,_,[]).
createTasks([Hss|Tss],[Hd|Td],[He|Te],[Hm|Tm],L) :-
	createTasks(Tss,Td,Te,Tm,Ltemp),
	append([task(Hss,Hd,He,1,Hm)],Ltemp,L).