:- use_module(library(clpfd)).	

sudoku(Rows):- 
	length(Rows, 9), maplist(same_length(Rows), Rows), 
    append(Rows, Values), 
    Values ins 1..9, 
    maplist(all_distinct, Rows), 
    transpose(Rows, Columns), 
    maplist(all_distinct, Columns), 
    Rows = [A,B,C,D,E,F,G,H,I], 
    blocks(A, B, C), blocks(D, E, F), blocks(G, H, I).

blocks([], [], []). 
blocks([A,B,C|Bs1], [D,E,F|Bs2], [G,H,I|Bs3]) :- 
    all_distinct([A,B,C,D,E,F,G,H,I]), 
    blocks(Bs1, Bs2, Bs3). 
	
writeRow([H1,H2,H3,H4,H5,H6,H7,H8,H9]) :- 
     write(H1), write(' '),
     write(H2), write(' '),
     write(H3), write(' '), write('|'),
     write(H4), write(' '),
     write(H5), write(' '),
     write(H6), write(' '), write('|'),
     write(H7), write(' '),
     write(H8), write(' '),
     write(H9), write(' '),
     nl.

writeSudoku([H1,H2,H3,H4,H5,H6,H7,H8,H9]) :- 
    writeRow(H1),
    writeRow(H2),
    writeRow(H3), 
    writeRow(H4),
    writeRow(H5),
    writeRow(H6), 
    writeRow(H7),
    writeRow(H8),
    writeRow(H9).

q(1, [[_,7,_,_,2,_,_,4,6], 
      [_,6,_,_,_,_,8,9,_], 
	  [2,_,_,8,_,_,7,1,5],
      [_,8,4,_,9,7,_,_,_],
      [7,1,_,_,_,_,_,5,9],
      [_,_,_,1,3,_,4,8,_],
      [6,9,7,_,_,2,_,_,8], 
      [_,5,8,_,_,_,_,6,_], 
      [4,3,_,_,8,_,_,7,_]]).


% Declare user input as specified above

% Command to execute 
% q(1, Rows), sudoku(Rows), writeSudoku(Rows).
