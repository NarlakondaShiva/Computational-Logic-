country(united_states).
county(italy).
americancitizen(john).
americancitizen(miriam).
americancitizen(caleb).
livein(john,italy).
americandiplomat(miriam).
livein(X,unitedstates) :-americancitizen(X),not abcitizen(X),not -livein(X,unitedstates).
abcitizen(X) :- americancitizen(X),not americandiplomat(X).
livein(X,unitedstates) :- not -livein(X,unitedstates),americandiplomat(X).
-livein(X,unitedstates) :- not livein(X,unitedstates), americandiplomat(X).
-livein(X,Z) :-americancitizen(X), country(Z),livein(X,Y), country(Y), Y != Z.
#show livein/2.
