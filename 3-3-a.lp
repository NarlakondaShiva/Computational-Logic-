%*
    Problem 3
*%

%*
    "American citizens normally live in the United States.
    American diplomats may or may not live in the United States.
    John, Miriam, and Caleb are American citizens.
    John lives in Italy.
    Miriam is an American diplomat."
*%

%*
    (a) Assume we do not have a complete list of American diplomats.
        (Note that your program should not be able to conclude that Caleb
        lives in the United States.)
*%

% People.
person(john).
person(miriam).
person(caleb).

% Places.
place(america).
place(italy).

% Known citizenship.
citizen(john, america).
citizen(miriam, america).
citizen(caleb, america).

% Known residency.
lives_in(john, italy).

% Diplomats.
diplomat(miriam, america).

lives_in(Person, america) :-
    % By default, Person lives in America if they are an American citizen.
    citizen(Person, america),
    % No known abnormalities.
    not ab(lives_in(Person, america)),
    % Not known to live in another country.
    not -lives_in(Person, america).

% Abnormality with respect to lives_in.
ab(lives_in(Person, america)) :-
    person(Person),
    % Person may be an American diplomat.
    % Conservative reasoning.
    not -diplomat(Person, america).

% A person cannot live in two places at once.
-lives_in(Person, Place) :-
    place(Place),
    lives_in(Person, Place2),
    Place != Place2.

% No way to prove a person is not a diplomat, since the list is incomplete.
-diplomat(Person, Place) :-
    -diplomat(Person, Place).

#show lives_in/2.
#show -lives_in/2.