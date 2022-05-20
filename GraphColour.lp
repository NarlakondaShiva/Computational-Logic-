#const n = 3.
{ color(X,1..n) } = 1 :- node(X).
:- edge(X,Y), color(X,C), color(Y,C).
node(1..6).
edge(1,(2;3;4)).  edge(2,(4;5;6)).  edge(3,(1;4;5)).
edge(4,(1;2)).    edge(5,(3;4;6)).  edge(6,(2;3;5)).
#show color/2.
