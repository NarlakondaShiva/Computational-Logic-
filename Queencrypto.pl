% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).
:- use_module(library(clpfd)).% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Your program goes here
nqueens(N, Qs) :-
        length(Qs, N),
        Qs ins 1..N,
        safequeen(Qs).

safequeen([]).
safequeen([Q|Qs]) :- safequeen(Qs, Q, 1), safequeen(Qs).

safequeen([], _, _).
safequeen([Q|Qs], First,Bal) :-
        First#\= Q,
        abs(First - Q) #\= Bal,
        Bal1 #= Bal + 1,
        safequeen(Qs, First, Bal1).
%2nd Cryptoarthematic
cryptoarthematic([S,E,N,D,M,O,R,Y]):-
    S in 1..9,
    E in 0..9,
    N in 0..9,
    D in 0..9,
    M in 1..9,
    O in 0..9,
    R in 0..9,
    Y in 0..9, 
    S#>0,
    M#>0,
    all_different([S,E,N,D,M,O,R,Y]),
    1000*S+100*E+10*N+D+1000*M+100*O+10*R+E#=10000*M+1000*O+100*N+10*E+Y.


