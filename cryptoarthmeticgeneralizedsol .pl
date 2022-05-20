% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers


cryptArithmetic([H1|T1] + [H2|T2] = [H3|T3]):-
    % appending the all the lists and getting a set from it 
    append([H1|T1], [H2|T2], L1),
    append(L1,[H3|T3],L2),
    list_to_set(L2, Distinctvaluelist),
    Distinctvaluelist ins 0..9,
    all_distinct(Distinctvaluelist),
    H1 #> 0, H2 #> 0, H3 #> 0,
    listto_numericvalue([H1|T1],R1),
    listto_numericvalue([H2|T2],R2),
    listto_numericvalue([H3|T3],R3),
    R3 #= R1 + R2,
    labeling([ffc],Distinctvaluelist).
%converting list into numeric value by multiplying with its tenth power.
listto_numericvalue([],0).
listto_numericvalue([H|T],R):-length(T,Len),Tenthmutipule #= 10^Len,TenthmutipuleValue #= Tenthmutipule * H,
    R #= R1 +TenthmutipuleValue ,listto_numericvalue(T,R1).
    
