%z1 póki co bubble sort, jak coś innego nam się wylosuje to zmienimy
sorted(L,S) :- len(L, N), bubbloop(L,N,S).

len([], 0).
len([H|T], N) :- len(T, NP), N is NP + 1.

bubbloop(A,0,A).
bubbloop(A,N,S) :- N>0, NP is N - 1, bubb(A,P), bubbloop(P,NP,S).

bubb([H|T],S) :- bubb2([H|T],T,S).
bubb2(L,[],L).
bubb2([X|T],[Y|C],[X|R]) :- X > Y, bubb2(T,C,R).
bubb2([X|T], [Y|C], [Y|R]) :- X =< Y, bubb2([X|C],C,R).

%z2 sprawdzanie czy ciąg jest graficzny
is_zero([X]) :- X = 0.
is_zero([H|T]) :- H = 0, is_zero(T).

has_negative([H]) :- H < 0.
has_negative([H|T]) :- H < 0 ; has_negative(T).

subd(A, 0, A).
subd([H|T], D, [HP|TP]) :- DP is D - 1,HP is H - 1, subd(T,DP, TP).

graphic(A, Ans) :- is_zero(A), Ans = "jest graficzny".
graphic(A, Ans) :- has_negative(A), Ans = "nie jest graficzny".
graphic(A, Ans) :- sorted(A,[H|T]),subd(T,H,P),graphic(P,Ans). 

%z3 sprawdzanie czy ciąg graficzny jest grafu spójnego