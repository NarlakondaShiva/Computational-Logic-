%Question 8

plus(0, N, N).
plus(s(M), N, s(P)) :-plus(M, N, P).
greater(X, Y) :- plus(Y, Z, X), Z \= 0.
qr(A, B, 0, A) :-greater(B, A).
qr(A, B, Q, R) :-plus(C, B, A), qr(C, B, T, R),plus(s(0), T, Q).
