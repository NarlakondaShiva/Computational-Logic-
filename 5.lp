%question5
field(mathematics).
field(science).

study_naturalworld(X) :- field(X),not study_pureideas(X).
study_pureideas(X) :- field(X),not study_naturalworld(X).
study_pureideas(X) :- field(X),X == mathematics,not ab1(X).
study_naturalworld(X) :-field(X),X == science,not ab2(X).
ab1(X) :- X == science.
ab2(X) :- X == mathematics.
person(daniela).
study(daniela,mathematics).
study(daniela,science).
study(X,Y) :- person(X),field(Y).
study_ourplaceworld(P) :- study(P,mathematics),study(P,science),person(P).
#show study_ourplaceworld/1.
