%ac>cd bc<bd
distto(X,[X|_],1).
distto(X,[Y|T],D):-not(Y=X),distto(X,T,D1),D is D1+1.
dist(X,Y,[Z|T],D):-(Z=X,distto(Y,T,D));(Z=Y,distto(X,T,D));dist(X,Y,T,D).
test(P):-(not((member(a,P),member(c,P),member(d,P)));
	                                 (dist(a,c,P,D1),dist(c,d,P,D2),D1>D2)),
	 (not((member(b,P),member(c,P),member(d,P)));
					 (dist(b,c,P,D3),dist(b,d,P,D4),D3<D4)).
%generate(0,[]).
% generate(X,[A|T]):-X1 is
% X-1,X1>=0,generate(X1,T),member(A,[a,b,c,d]),not(member(A,T)).
generate(P):-P=[_,_,_,_],member(a,P),member(b,P),member(c,P),member(d,P).
sol(P):-generate(P),test(P).
label1([First,Second]):-First=princess,Second=tiger.
label2([princess,tiger]).
label2([tiger,princess]).
emperor(Label1,Label2):-Label1,not(Label2).
emperor(Label1,Label2):-Label2,not(Label1).
solemp([First,Second]):-emperor(label1([First,Second]),label2([First,Second])).
succesor([X,0,0],[X1,1,0]):-X1 is X-1,!.
succesor([X,Y,Z],[X1,Y1,Z1]):-X>0,Z<3,X1 is X-1,Y1 is Y+1,Z1=Z.
succesor([X,Y,Z],[X1,Y1,Z1]):-Y>0,Z<3,Y1 is Y-1,X1 is X+1,Z1=Z.
succesor([X,Y,Z],[X1,Y1,Z1]):-Y>0,Z<3,Y1 is Y-1,Z1 is Z+1,X1=X.
search_depth(Path,[0,0,3],[[0,0,3]|Path]):-!.
search_depth(Path,State,Sol):-succesor(State,NewState),not(member(NewState,Path)),
	                            search_depth([State|Path],NewState,Sol).
solve_depth:-Init=[3,0,0],search_depth([],Init,P),write(P).
search_length([[Node|Path]|_],Node,[Node|Path]).
search_length([[Node|Path]|RestPaths],Target,Sol):-
	findall([NewNode,Node|Path],(succesor(Node,NewNode),not(member(NewNode,Path))),NewPaths),append(NewPaths,RestPaths,CurrPaths),search_length(CurrPaths,Target,Sol).
solve_length:-search_length([[[3,0,0]]],[0,0,3],Sol),write(Sol).
