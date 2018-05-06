inserting(X,[],[X]).
inserting(X,List,Res):-Res=[X|List],not(List=[]).
inserting(X,[H|T],Res):-inserting(X,T,R1),Res=[H|R1].
deletingone(_,[],[]).
deletingone(X,[X|T],Res):-Res=T.
deletingone(X,[H|T],[H|R1]):-deletingone(X,T,R1),not(R1=T).
deletingall(_,[],[]).
deletingall(X,[X|T],R1):-deletingone(X,T,R1),not(R1=T).
deletingall(X,[H|T],[H|R1]):-not(H=X),deletingall(X,T,R1),not(R1=T).
range(X,X,[X]).
range(X,Y,[X|R1]):-X<Y,X1 is X+1,range(X1,Y,R1).
%ROTATE LEFT length-n=rotate right n
rotate(List,X,List):-length(List,X).
rotate([H|T],X,List):-length([H|T],Y),X<Y,append(T,[H],L1),X1 is X+1,rotate(L1,X1,List).
flattenlist([],[]).
flattenlist([H|T],List):-is_list(H),flattenlist(H,L1),flattenlist(T,L2),append(L1,L2,List).
flattenlist([H|T],[H|L1]):-not(is_list(H)),flattenlist(T,L1).
inverting([X],[X]).
inverting([H|T],List):-inverting(T,L1),append(L1,[H],List).
duplicate([X],[[X,X]]):-not(is_list(X)).
duplicate([H|T],[[H,H]|L2]):-duplicate(T,L2).
createlis(0,[]):-!.
createlis(El,[X|L1]):-read(X),!,El1 is El - 1,createlis(El1,L1).
show(tree(Key,null,null),[Key]).
show(tree(Key,L,null),List):-show(L,L1),append(L1,[Key],List).
show(tree(Key,null,R),List):-show(R,L2),append(Key,L2,List).
show(tree(Key,L,R),List):-show(L,L1),show(R,L2),Laux=[Key|L2],append(L1,Laux,List).
