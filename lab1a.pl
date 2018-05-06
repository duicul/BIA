father(john,adam).
father(john,johnny).
father(luxy,john).
father(popa,luxy).
father(popa,cornel).
father(popa,flavius).
father(luxy,sorin).
father(martin,popa).
child(X,Y):-father(Y,X).
brother(X,Y):-father(Z,X),father(Z,Y),not(X=Y).
nephew(X,Y):-child(X,Z),brother(Z,Y).
grandchild(X,Y):-child(X,Z),child(Z,Y).
predecessor(X,Y):-child(X,Y);(child(X,Z),predecessor(Z,Y)).
