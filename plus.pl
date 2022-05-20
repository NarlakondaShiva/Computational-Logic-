plus(0,Y,Y).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).
times(0,Y,0).
times(s(X),Y,R):-times(X,Y,Z),plus(Z,Y,R).
great(s(_),0).
great(s(X),s(Y)):-great(X,Y).

fib(0,s(0)).
fib(s(0),s(0)).
fib(s(s(X)),H):-fib(s(X),R1),fib(s(X),R2),plus(R1,R2,H).

factorial(0,s(0)).
factorial(s(X),Y):-factorial(X,F),times(s(X),F,Y).
