perm(A,[S|B]):-select(S,A,SA),write(S),write(SA),perm(SA,B).
perm([],[]).
select(A,[H|X],[H|Y]):-select(A,X,Y).
select(A,[A|T],T).
