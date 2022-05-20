% Nodes.
node(1).
node(2).
node(3).
node(4).
node(5).

% Edges.
edge(1,2).
edge(1,3).
edge(2,4).
edge(2,5).
edge(3,4).
edge(3,5).

% Colors.
color(red).
color(green).
color(yellow).

% X is colored a color other than C if there exists some other color C2 where
% color(X,C2) is true.
other_color(X,C) :- color(C), color(C2), C \= C2, color(X,C2).

% C is a valid color for X if it is not colored by another color.
color(X,C) :-
    node(X),
    color(C),
    not other_color(X,C).

% Global constraint.
% For any edge (X,Y), X and Y cannot be the same color.
:- edge(X,Y), color(X,C), color(Y,C).

?- color(1,C).

#show color/2.