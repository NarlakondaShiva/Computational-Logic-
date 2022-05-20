% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Zebra puzzle

zebra([English,Spaniard,Italy,Japanese,Norwegian],X):-
Vars=[English,Spaniard,Italy,Japanese,Norwegian,Red,Green,Yellow,Blue,White,Dog,Snails,Fox,Horse,Zebra,Tea,Coffee,Milk,OrangeJuice,Water,Painter,Diplomat,Violinist,Doctor,Sculptor],
/* 1. There are five houses.*/
Vars ins 1..5,
English#=Red,
Spaniard#=Dog,
Japanese#=Painter,
Coffee#=Italy,
Norwegian#=1,
Green#=Coffee,
Green#=White+1,
Sculptor#=Snails,
Diplomat#=Yellow,
Milk#=3,
Norwegian#=Blue+1,
Violinist#=OrangeJuice,    
Fox#=Doctor+1,
Horse#=Diplomat+1,  
all_different([English,Spaniard,Italy,Japanese,Norwegian]),
all_different([Red,Green,Yellow,Blue,White]),
all_different([Coffee,Water,Milk,OrangeJuice,Tea]),
all_different([Dog,Fox,Horse,Snails,Zebra]),
all_different([Painter,Diplomat,Violinist,Doctor,Sculptor]),
label(Vars).


