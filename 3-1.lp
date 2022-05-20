%*
    Problem 1
*%

%*
    “Apollo and Helios are lions in a zoo. Normally lions are dangerous.
    Baby lions are not dangerous. Helios is a baby lion.” Assume that the
    zoo has a complete list of baby lions that it maintains regularly. Your
    program should be able to deduce that Apollo is dangerous, whereas
    Helios is not. Make sure that (a) if you add another baby lion to your
    knowledge base, the program would derive that it is not dangerous, even
    though that knowledge is not explicit; and (b) if you add an explicit fact
    that Apollo is not dangerous, there is no contradiction and the program
    answers intelligently
*%

% Lions.
lion(apollo).
lion(helios).

% Babies.
baby(helios).

% X is dangerous if X is a lion, X cannot be proved to be abnormal with respect
% to dangerous, and X cannot be proved to not be dangerous.
dangerous(X) :- lion(X), not ab(dangerous(X)), not -dangerous(X).
% X is abnormal with respect to dangerous if X is a baby lion.
ab(dangerous(X)) :- lion(X), baby(X).
% X is not dangerous if X is a baby lion.
-dangerous(X) :- lion(X), baby(X).

#show dangerous/1.
#show -dangerous/1.