% Constraint Logic Programming
:- use_module(library(dif)).	% Sound inequality
:- use_module(library(clpfd)).	% Finite domain constraints
:- use_module(library(clpb)).	% Boolean constraints
:- use_module(library(chr)).	% Constraint Handling Rules
:- use_module(library(when)).	% Coroutining
%:- use_module(library(clpq)).  % Constraints over rational numbers

% Constraint Logic Programming
:- use_module(library(clpfd)).	% Finite domain constraints


graphcoloring(Nodes,Edges,Finaloutput):-assigningcolortonode(Nodes, Colors, Output),
    Colors ins 1..4, 
    differentcolor(Edges, Output),
    changeColor(Output, Finaloutput),
    labeling([ff], Colors).

%each and every color is assigned to every node in Nodes and put in to output list.
assigningcolortonode([],[],[]).
assigningcolortonode([N|Nodes], [C|Colors], [(N,C)|Output]) :-
assigningcolortonode(Nodes, Colors, Output).
%changecolour predicate will assign color to each interger in the domain.
changeColor([],[]).
changeColor([(M,N)|Output],[(M,yellow)|Finaloutput]):-(1 #= N), changeColor(Output,Finaloutput).
changeColor([(M,N)|Output],[(M,blue)|Finaloutput]):-(2 #= N), changeColor(Output,Finaloutput).
changeColor([(M,N)|Output],[(M,green)|Finaloutput]):-(3 #= N), changeColor(Output,Finaloutput).
changeColor([(M,N)|Output],[(M,red)|Finaloutput]):-(4 #= N), changeColor(Output,Finaloutput).
%no two nodes with same edge will not have same color .
differentcolor([],_).
differentcolor([[A,B]|P], Output) :- member((A,CA), Output),member((B,CB), Output),CA #\= CB,
differentcolor(P, Output).

