% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

:- use_module(library(clpfd)).


solve(Nationalities,Colors, Beverages,Profession,Pets):-
    Nationalities = [English,Spaniard,Italy,Japanese,Norwegian],
    Colors = [Red,Green,Yellow,Blue,White],
    Beverages = [_Tea,Coffee,Milk,OrangeJuice,_Water],
    Profession = [Painter,Diplomat,Violinist,Doctor,Sculptor],
    Pets = [Dog,Snails,Fox,Horse,_Zebra],

    all_different(Nationalities),
    all_different(Colors),
    all_different(Beverages),
    all_different(Profession),
    all_different(Pets),

    Nationalities ins 1..5,
    Colors ins 1..5,
    Beverages ins 1..5,
    Profession ins 1..5,
    Pets ins 1..5,
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
    Labeling([ffc], Nationalities ),
    Labeling([ffc],Colors),
    Labeling([ffc],Beverages),
    Labeling([ffc],Profession),
    Labeling([ffc],Pets).
    
   

   