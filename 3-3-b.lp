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
    (b) Now assume we have a complete list of American diplomats. Add
        this information to the program. What does your new program say
        about Caleb’s place of residence?
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

% Diplomat is a complete list.
% Person is not a diplomat of Place if there is no proof they are one.
-diplomat(Person, Place) :-
    person(Person),
    place(Place),
    not diplomat(Person, Place).

#show lives_in/2.
#show -lives_in/2.