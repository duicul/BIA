:-op(600,fx,deleting).
:-op(500,xfx,gives).
:-op(400,xfx,from).
:-op(600,fx,concatenating).
:-op(600,fx,intersecting).
:-op(400,xfx,with).
:-op(300,xfx,'..').
:-op(200,fx,'{').
:-op(200,xf,'}').
:-op(400,xfy,and).
:-op(400,xfx,from).
:-op(600,xfx,was).
:-op(500,xfx,of).
:-op(400,fx,the).
john was the secretary of the department.
deleting _ from [] gives [].
deleting X from [X|T] gives Z:-deleting X from T gives Z.
deleting X from [Y|T] gives [Y|Z]:-not(Y=X),deleting X from T gives Z.
concatenating X and L gives Z:-is_list(L),append(X,L,Z).
concatenating X and L gives Z:-not(is_list(L)),L = L1 and L2,concatenating L1 and L2 gives Y,append(X,Y,Z).
squares:-writef(' %d ' , ["Enter a number:"]),read(X),((not(X=stop),X2 is X*X,writef('%d^2=%d\n',[X,X2]),squares);X=stop).
{X..Y}:-not(X>Y).
writelist([]).
writelist([H|T]):-writef("%d ",[H]),writelist(T).
intersecting [] with _ gives [].
intersecting _ with [] gives [].
intersecting X with [X|_] gives [X]:-not(is_list(X)).
intersecting X with [Y|T] gives	Z:-not(is_list(X)),not(Y=X),intersecting X with T gives Z.
intersecting [X|T] with	 L gives Z:-intersecting X with  L  gives L1,intersecting T with L gives L2,append(L1,L2,Z).
intersecting {X1..Y1} with {X2..Y2} gives Z:-X1<Y2,((Y1<X2,Z=void);(Y1=X2,Z=void);(X2<Y1,X1<X2,Z={X2..Y1})).
intersecting {X1.._} with {_..Y2} gives X1:-X1=Y2.
intersecting {X1..Y1} with {X2..Y2} gives Z:-X2<Y1,((Y2>X1,X1>X2,Z={X1..Y2});(X1=Y2,Z=X1);(Y2<X1,Z=void)). %max(A,B) {A..B}
copbyte(SX,SY):-get_byte(SX,B),put_byte(SY,B).
copy:-open("input.txt",read,SX),open("output.txt",read,SY),copbyte(SX,SY).

