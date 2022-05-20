% s(CASP) Programming
:- use_module(library(scasp)).
% Uncomment to suppress warnings
%:- style_check(-discontiguous).
%:- style_check(-singleton).
%:- set_prolog_flag(scasp_unknown, fail).

% Your program goes here

% which will check for the abnormal condition  where the node will not have any incoming nodes to it .
no_edge_in(Vertices,Edges,Vertice):-member(Vertice,Vertices),not abnormal(Vertice,Edges).
abnormal(Vertice,Edges):-member(e(_P,Vertice),Edges).
member(X,[X|_T]).
member(X,[_H|T]) :- member(X,T).