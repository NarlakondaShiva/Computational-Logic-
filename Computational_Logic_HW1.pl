%Question 1
father(tony,abe).
father(tony,sarah).
father(abe,john).
father(bill,susan).
father(john,jill).
father(rob,jack).
father(rob,phil).
father(jack,jim).

mother(lisa,abe).
mother(lisa,sarah).
mother(nancy,john).
mother(sarah,susan).
mother(mary,jill).
mother(susan,jack).
mother(susan,phil).
mother(kim,jim).


male(tony).
male(abe).
male(bill).
male(john).
male(rob).
male(rick).
male(jack).
male(phil).
male(jim).

female(lisa).
female(nancy).
female(sarah).
female(mary).
female(susan).
female(jill).
female(ann).
female(kik).
female(martha).

parent(X,Y):-father(X,Y).
parent(X,Y):-mother(X,Y).

gparent(X,Y):- parent(X,Z), parent(Z,Y).

ggparent(X,Y):- parent(X,Z),gparent(Z,Y).

gggparent(X,Y):- parent(X,Z),ggparent(Z,Y).

siblings(X,Y):- parent(Z,X), parent(Z,Y),not(X=Y).

%Question 2

firstcousin(X,Y):-gparent(Z,X),gparent(Z,Y),not(siblings(X,Y)).
secondcousin(X,Y) :- parent(A,X),parent(B,Y),firstcousin(A,B).

greatnephew(X,Y):- siblings(Y,Z),gparent(Z,X), male(X).


niece(X,Y):-siblings(Y,Z),parent(Z,X),female(X).

manc(X,Y):-parent(X,Y),male(X).
manc(X,Y):-gparent(X,Y), male(X).
manc(X,Y):-ggparent(X,Y), male(X).
manc(X,Y):-gggparent(X,Y), male(X).


% Question 3
samegencousins(X,Y):- gparent(Z,X),gparent(Z,Y),not(siblings(X,Y)),not(X=Y).
samegencousins(X,Y):-ggparent(Z,X),ggparent(Z,Y),not(siblings(X,Y)),not(X=Y).
samegencousins(X,Y):-gggparent(Z,X),gggparent(Z,Y),not(siblings(X,Y)),not(X=Y).


% Question 4
married(jill,rick).
married(jack,kim).
married(jim,martha).
married(phil,ann).
married(X,Y):-father(X,A),mother(Y,A).
married(X,Y):-father(Y,A),mother(X,A).

greatnephew1(X,Y):- siblings(Y,Z),gparent(Z,X),male(X).
greatnephew1(X,Y):- siblings(Y,Z),gparent(Z,Z1),married(Z1,X),male(X).

niece1(X,Y):-siblings(Y,Z),parent(Z,X),female(X).
niece1(X,Y):-siblings(Y,Z),parent(Z,Z1),male(Z1),married(Z1,X),female(X).


%Question 6
plus(0,Y,Y).
plus(s(X),Y,s(Z)):-plus(X,Y,Z).
times(0,Y,0).
times(s(X),Y,R):-times(X,Y,Z),plus(Z,Y,R).
great(s(_),0).
great(s(X),s(Y)):-great(X,Y).

%Question 7
factorial(0,s(0)).
factorial(s(X),Y):-factorial(X,F),times(s(X),F,Y).

%Question 9 

fib(0,s(0)).
fib(s(0),s(0)).
fib(s(s(X)),H):-fib(s(X),R1),fib(s(X),R2),plus(R1,R2,H).

%Assignment_2:


%Lists

list_member(X,[X|_]).
list_member(X,[K|TAIL]) :-write(K),list_member(X,TAIL).

list_len([],0).
list_len([_|T],N]):-list_len(T,N1),N is N1+1.

