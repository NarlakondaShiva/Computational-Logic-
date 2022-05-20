%*
    Problem 5
*%

%*
    "A field that studies pure ideas does not study the natural world. A field
    that studies the natural world does not study pure ideas. Mathematics
    normally studies pure ideas. Science normally studies the natural world.
    As a computer scientist, Daniela studies both mathematics and science.
    Both mathematics and science study our place in the world." Make sure
    your program can deduce that Daniela studies our place in the world.
*%

% Fields.
field(mathematics).
field(science).

% Topics.
topic(naturalworld).
topic(pureideas).
topic(ourplaceintheworld).

% People.
person(daniela).

% Computer scientists.
computer_scientist(daniela).

% Known topics studied.
field_studies_topic(mathematics, pureideas).
field_studies_topic(science, naturalworld).
field_studies_topic(mathematics, ourplaceintheworld).
field_studies_topic(science, ourplaceintheworld).

% A field does not study the natural world if it studies pure ideas.
-field_studies_topic(Field, naturalworld) :-
    field_studies_topic(Field, pureideas).
% A field does not study pure ideas if it studies the natural world.
-field_studies_topic(Field, pureideas) :-
    field_studies_topic(Field, naturalworld).

% A person studies mathematics if they are a computer scientist.
person_studies_field(Person, mathematics) :-
    computer_scientist(Person).
% A person studies science if they are a computer scientist.
person_studies_field(Person, science) :-
    computer_scientist(Person).

% A person studies a topic if...
person_studies_topic(Person, Topic) :-
    % Person studies a field...
    person_studies_field(Person, Field),
    % that studies a topic.
    field_studies_topic(Field, Topic).

#show person_studies_topic/2.