%sol=[princ(),tiger]
label1([X1,Y1]):-X1=princ,Y1=tiger.
label2([X1,Y1]):-(X1=princ,Y1=tiger);(X1=tiger,Y1=princ).
emperor(X,Y):-(X,not(Y));(Y,not(X)).
solution([X1,Y1]):-emperor(label1([X1,Y1]),label2([X1,Y1])).
