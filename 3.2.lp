country(united_states).
country(italy).
american_citizen(john).
american_citizen(miriam).
american_citizen(caleb).
live_in(john,italy).
american_diplomat(miriam).
-american_diplomat(X) :- american_citizen(X),not american_diplomat(X).
live_in(X,united_states) :-american_citizen(X),-american_diplomat(X),not -live_in(X,united_states).
live_in(X,united_states) :- not -live_in(X,united_states),american_diplomat(X).
-live_in(X,united_states) :- not live_in(X,united_states), american_diplomat(X).
-live_in(X,Z) :-american_citizen(X), country(Z),live_in(X,Y), country(Y), Y != Z.
#show live_in/2.
