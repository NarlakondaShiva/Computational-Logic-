
#include <incmode>.

place(base).
place(X) :- block(X).
holds(M,0) :- initial(M).
#program step(t).

{ move(X,Y,t) : block(X), place(Y), X != Y } = 1.

:- move(X,Y,t), holds(on(A,X),t-1).
:- move(X,Y,t), holds(on(B,Y),t-1), B != X, Y != table.
moved(X,t) :- move(X,Y,t).
holds(on(X,Y),t) :- move(X,Y,t).
holds(on(X,Z),t) :- holds(on(X,Z),t-1), not moved(X,t).
#program check(t).
% Test
:- query(t), goal(M), not holds(M,t).

block(block0).
block(block1).
block(block2).

initial(on(block1,table)).
initial(on(block2,b0)).
initial(on(block0,table)).

goal(on(block1,block0)).
goal(on(block2,block1)).
goal(on(block0,table)).

#show move/3.
