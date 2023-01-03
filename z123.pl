%z1 póki co bubble sort, jak coś innego nam się wylosuje to zmienimy
sorted([], []).
sorted([A],[A]).
sorted([X,Y|T], S) :- split([X,Y|T], L1, L2), sorted(L1, S1), sorted(L2, S2), merge(S1, S2, S).

split([],[],[]).
split([X],[X],[]).
split([X,Y|T], [X|T1], [Y|T2]) :- split(T, T1, T2).

merge(X,[],X).
merge([],Y,Y).
merge([X|T1], [Y|T2], [X|T]) :- X > Y, merge(T1, [Y|T2], T).
merge([X|T1], [Y|T2], [Y|T]) :- X =< Y, merge([X|T1],T2, T).

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

len([], 0).
len([H|T], N) :- len(T, NP), N is NP + 1.

sum([],0).
sum([H|T], S) :- sum(T, P), S is H + P.

no_zeros([X]) :- X =\= 0 .
no_zeros([H|T]) :- H =\= 0, no_zeros(T).

connected(A) :- graphic(A,Ans), Ans = "jest graficzny",no_zeros(A), sum(A, S), len(A, N), S >= 2 * (N-1).
connected(A, Out) :- connected(A), Out = "jest spojny" ; Out = "nie jest spojny".
