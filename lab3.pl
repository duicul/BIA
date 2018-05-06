abs(X,Y):-X<0,Y is -X,!.
abs(X,Y):-Y is X.
abs(X,Y):-X<0,Y is -X;X>0,Y is X.
fact(0,1):-!.
fact(N,F):-N_1 is N-1,fact(N_1,F_1),F is F_1.
fib(0,0):-!.
fib(1,1):-!.
fib(X,Y):-X>1,X1 is X-1,X2 is X-2,fib(X1,Y1),fib(X2,Y2),Y is Y1+Y2.
gcd(X,0,X):-!.
gcd(X,Y,Z):-Y1 is X mod Y,gcd(Y,Y1,Z).
evaluating(X,X):-number(X).
evaluating(X1+X2,Y):-evaluating(X1,Y1),plus(Y1,X2,Y).
evaluating(X1-X2,Y):-evaluating(X1,Y1),plus(Y,X2,Y1).
