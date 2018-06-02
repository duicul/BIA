%[A,B,C,D]
%P=[A,B,C,D] ->cities
%AC>CD
%BC<BD
%A     D    C      D      A
%B     C    D      C      B
%bigger(X):-X=[a,d,c];X=[a,c,d].
%bigger(X):-X=[c,d,a];X=[d,c,a].
%bigger(X):-X=[b,c,d];X=[b,d,c].
%bigger(X):-X=[d,c,b];X=[c,d,b].
dist(_,_,[],0).
dist(_,_,[_],0).
dist(X,Y,Z,D):-length(Z,2),(Z=[X,Y];Z=[Y,X]),D=1.
dist(X,Y,Z,D):-length(Z,3),( ((Z=[X,_,Y];Z=[Y,_,X]),D=2);
                             (Z=[X1,Y1,Z1],((dist(X,Y,[X1,Y1],D1),D=D1);
                                            (dist(X,Y,[Y1,Z1],D1),D=D1)
                                           )
                              )
                            ).
dist(X,Y,Z,D):-length(Z,4),( ((Z=[X,_,_,Y];Z=[Y,_,_,X]),D=3);
                             (Z=[W1,X1,Y1,Z1],((dist(X,Y,[W1,X1,Y1],D1),D=D1);
                                               (dist(X,Y,[X1,Y1,Z1],D1),D=D1)
                                              )
                             )
                           ).
%dist([X,I1],[Y,I2],D):-I is I1-I2,abs(I,D).
%distance from a c is bigger than cd,!
%distance from b d is bigger than bc,!
test(P):-length(P,L),L>=2,
                 (not((member(a,P),member(c,P),member(d,P))),!;
                 (dist(a,c,P,D1),dist(c,d,P,D2),D1>D2,
                                                      member(a,P),member(c,P),member(d,P),!)
                ,(not((member(b,P),member(c,P),member(d,P))),!;
                 (dist(b,c,P,DI1),dist(b,d,P,DI2),DI1<DI2,
                                                      member(b,P),member(c,P),member(d,P),!))).
test(P):-length(P,L),L<2.
solution(0,[]).
solution(X,P):-X1 is X-1,X1>=0,solution(X1,Q),P=[A|Q],member(A,[a,b,c,d]),not(member(A,Q)),test(P).
