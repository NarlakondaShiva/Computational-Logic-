lion(apollo).
lion(helios).

lion(X) :- babylion(X).

dangerous(X) :- lion(X),not babylion(X),not -dangerous(X).
-dangerous(X):-babylion(X).

babylion(helios).

babylion(lamo).
-dangerous(apollo).
