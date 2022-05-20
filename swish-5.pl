% Constraint Logic Programming
:- use_module(library(dif)).	
:- use_module(library(clpfd)).	
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

zebrapuzzle(Water,Zebra):-
Vars=[English,Spaniard,Ukrainian,Japanese,Norwegian,
Red,Green,Yellow,Blue,Ivory,
Dog,Snails,Fox,Horse,Zebra,
Tea,Coffee,Milk,OrangeJuice,Water,
Kools,Chesterfields,Parliaments,LuckyStrike,OldGold],
Vars ins 1..5,
all_different([English,Spaniard,Ukrainian,Japanese,Norwegian]),
all_different([Red,Green,Yellow,Blue,Ivory]),
all_different([Coffee,Water,Milk,OrangeJuice,Tea]),
all_different([Dog,Fox,Horse,Snails,Zebra]),
all_different([Chesterfields,LuckyStrike,Parliaments,Kools,OldGold]),
label(Vars).
English#=Red,
Spaniard#=Dog,
Coffee#=Green,
Ukrainian#=Tea,
Green#=Ivory+1,
OldGold#=Snails,
Kools#=Yellow,
Milk#=3,
Norwegian#=1,
Chesterfields#=Fox-1#\/Chesterfields#=Fox+1,
Kools#=Horse+1#\/Kools#=Horse-1,
LuckyStrike#=OrangeJuice,
Japanese#=Parliaments,
Norwegian#=Blue+1#\/NO#=Blue-1,
