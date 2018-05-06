add(tree(Key,null,null),Key):-number(Key).
add(tree(Key,St1,null),S):-add(St1,S1),S is S1+Key.
add(tree(Key,null,St2),S):-add(St2,S2),S is S2+Key.
add(tree(Key,St1,St2),S):-add(St1,S1),add(St2,S2),S is Key+S1+S2,not(St1=null),not(St2=null).

count_leaves(tree(X,null,null),1):-number(X).
count_leaves(tree(_,St1,null),C):-count_leaves(St1,C1),C is C1.
count_leaves(tree(_,null,St2),C):-count_leaves(St2,C2),C is C2.
count_leaves(tree(_,St1,St2),C):-count_leaves(St1,C1),count_leaves(St2,C2),C is C1+C2,not(St1=null),not(St2=null).

compute(tree(K,null,null),K):-number(K),!.
compute(tree(+,L,R),Res):-compute(L,Res1),compute(R,Res2),Res is Res1+Res2.
compute(tree(-,L,R),Res):-compute(L,Res1),compute(R,Res2),Res is Res1-Res2.
compute(tree(/,L,R),Res):-compute(L,Res1),compute(R,Res2),Res is Res1/Res2.
compute(tree(*,L,R),Res):-compute(L,Res1),compute(R,Res2),Res is Res1*Res2.

convert(X,tree(X,null,null)):-number(X),!.
convert(X+Y,tree(+,R1,R2)):-convert(X,R1),convert(Y,R2).
convert(X-Y,tree(-,R1,R2)):-convert(X,R1),convert(Y,R2).
convert(X*Y,tree(*,R1,R2)):-convert(X,R1),convert(Y,R2).
convert(X/Y,tree(/,R1,R2)):-convert(X,R1),convert(Y,R2).

