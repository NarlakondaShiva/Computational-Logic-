mem(X,X|_).
write(X)
mem(X,_|P):- mem(X,P).
