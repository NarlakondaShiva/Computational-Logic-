blockworld(I,F,R) :-transform(I,F,R),length(R,P),write(P).

block(a).
block(b). 
block(c). 
block(d). 
block(e).

place(p).
place(q). 
place(r).

transform(State1,State2,Plan) :-transform(State1,State2,[State1],Plan).

transform(State1,State2,_,[]) :- permutation(State1,State2).
transform(State1,State2,Visited,[Act|Acts]) :-chooseact(Act,State1,State2),
 update(Act,State1,State), \+ member(State,Visited),transform(State,State2,[State|Visited],Acts).
permutation([],[]).
permutation(P,[X|Xs]) :-select(X,P,R), permutation(R,Xs).
chooseact(Act,State1,State2) :-move(Act,State2), legalAct(Act,State1).

chooseact(Act,State1,_) :-legalAct(Act,State1).
move(toPlace(X,_,Z), State) :-member(on(X,Z),State), place(Z).
move(toBlock(X,_,Z), State) :-member(on(X,Z),State), block(Z).

legalAct(toPlace(Block,M,Place),State) :-
    member(on(Block,M),State),
    clear(Block,State),
    place(Place),
    clear(Place,State).

legalAct(toBlock(Block1,M,Block2),State) :-
    member(on(Block1,M), State),
    clear(Block1,State),
    block(Block2), Block1 \= Block2,
    clear(Block2,State).

clear(X,State) :- \+ member(on(_,X),State).
substitution(First,Second,First,Second).

substitution(First,_,T,T) :- constant(T), T \== First.

substitution(First,Second,T,T1) :-compound(T), functor(T,F,N),
 functor(T1,F,N),substitution(N,First,Second,T,T1).

substitution(N,First,Second,T,T1) :-
    N > 0, arg(N,T,Arg),
    substitution(First,Second,Arg,Arg1),
    arg(N,T1,Arg1), N1 is N-1,
    substitution(N1,First,Second,T,T1).

substitution(0,_,_,_,_).
constant(X) :- atomic(X).
update(toBlock(X,Y,Z), State, State1) :-
    substitution(on(X,Y),on(X,Z),State,State1).

update(toPlace(X,Y,Z), State, State1) :-
    substitution(on(X,Y),on(X,Z),State,State1).



