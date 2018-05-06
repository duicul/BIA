:-dynamic(edge/3).
create_edges(X):-write('other node'),read(Y),not(Y=exit),write('dist'),read(Z),assert(edge(X,Y,Z)),create_edges(X).
add_node:-write('exit to stop \n node: '),read(X),not(X=exit),create_edges(X).
delete_node:-write('node: '),read(X),(retractall(edge(X,_,_));retractall(edge(_,X,_))).
add_edge:-write('node: '),read(X),write('other node'),read(Y),write('dist'),read(Z),assert(edge(X,Y,Z)).
delete_edge:-write('node: '),read(X),write('other node'),read(Y),retractall(edge(X,Y,_)).
show_edges:-findall([X,Y,Z],edge(X,Y,Z),L),write(L).
drum_minim([L,D],L,D):-is_list(L),number(D).
drum_minim([[L,D]|T],Dr,Dist):-is_list(L),number(D),drum_minim(T,Dr1,Dist1),((D<Dist1,Dist=D,Dr=L);(D>=Dist1,Dist=Dist1,Dr=Dr1)).
drum(X,X,[X],0,_).
drum(X,Y,[X|L1],D,Vis):-not(X=Y),edge(X,Aux,D2),not(member(Aux,Vis)),drum(Aux,Y,L1,D1,[Aux|Vis]),D is D1+D2.
short_path:-write('node: '),read(X),write('other node'),read(Y),findall([D,Path],drum(X,Y,Path,D,[]),L),sort(L,Q),Q=[[Dist,Dr]|_],write(Dr),write(Dist).
meniu:-write('1-add_node\n2-delete_node\n3-add_edge\n4-delete_edge\n5-show_nodes\n6-shortest_path\n'),read(X),((X=1,add_node);(X=2,delete_node);(X=3,add_edge);(X=4,delete_edge);(X=5,show_edges);(X=6,short_path)).


