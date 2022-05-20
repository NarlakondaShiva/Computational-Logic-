blockworld(I,F,R) :-transform(I,F,R).

block(a).
block(b). 
block(c). 
block(d). 
block(e).

place(p).
place(q). 
place(r).

transform(State1,State2,Plan) :-
    transform(State1,State2,[State1],Plan).

transform(State1,State2,_,[]) :-
    permute(State1,State2).

transform(State1,State2,Visited,[Action|Actions]) :-
    choose_action(Action,State1,State2),
    update(Action,State1,State),
    \+ member(State,Visited),
    transform(State,State2,[State|Visited],Actions).

choose_action(Action,State1,State2) :-
    move(Action,State2), legalAction(Action,State1).

choose_action(Action,State1,_) :-
    legalAction(Action,State1).

move(toPlace(X,_,Z), State) :-
    member(on(X,Z),State), place(Z).

move(toBlock(X,_,Z), State) :-
    member(on(X,Z),State), block(Z).

legalAction(toPlace(Block,Y,Place),State) :-
    member(on(Block,Y),State),
    clear(Block,State),
    place(Place),
    clear(Place,State).

legalAction(toBlock(Block1,Y,Block2),State) :-
    member(on(Block1,Y), State),
    clear(Block1,State),
    block(Block2), Block1 \= Block2,
    clear(Block2,State).

clear(X,State) :- \+ member(on(_,X),State).

update(toBlock(X,Y,Z), State, State1) :-
    substitute(on(X,Y),on(X,Z),State,State1).

update(toPlace(X,Y,Z), State, State1) :-
    substitute(on(X,Y),on(X,Z),State,State1).

substitute(Old,New,Old,New).

substitute(Old,_,Term,Term) :-
    constant(Term), Term \== Old.

substitute(Old,New,T,T1) :-
    compound(T), functor(T,F,N),
    functor(T1,F,N), substitute(N,Old,New,T,T1).

substitute(N,Old,New,T,T1) :-
    N > 0, arg(N,T,Arg),
    substitute(Old,New,Arg,Arg1),
    arg(N,T1,Arg1), N1 is N-1,
    substitute(N1,Old,New,T,T1).

substitute(0,_,_,_,_).

constant(X) :- atomic(X).


permute([],[]).
permute(P,[X|Xs]) :-
    select(X,P,R), permute(R,Xs).


