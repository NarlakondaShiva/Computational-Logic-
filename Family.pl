male(tony) .
male(abe).
male(bill).
male(john).
male(rob).
maler(rick).
male(jack) . 
male(phil) .

male(jim) .

female(lisa) .
female(nancy).
female(sarah).
female(mary).
female(susan).
female(jill).
female(kim).
female(ann).
female(martha).
father(tony,abe).
father(tony,sarah).
father(abe,john).
father(john,jill).
father(bill,susan).
father(rob,jack).
father(rob,phil).
father(jack,jim).
mother(lisa,abe).
mother(lisa,sarah).
mother(nancy,john).
mother(sarah,susan).
mother(mary,jill).
mother(susan,phil).
mother(susan,jack).
parent(X,Y):-father(X,Y).
parent(X,Y):-mother(X,Y).
gp(X,Y):-parent(X,Z),parent(Z,Y).
ggp(X,Y):-parent(X,Z),gp(Z,Y).
sibling(X,Y):-parent(Z,X),parent(Z,Y).
fcousin(X,Y):-gp(Z,X),gp(Z,Y),not(sibling(X,Y)).
































