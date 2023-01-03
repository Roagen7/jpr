%5.6.2

mySame(X,X).

% RULE 6
% only moves right one, two or three positions
% where dst is any number and while moving all fields should be <= 2

generateP1([],[]).
generateP1([H|T],[H|P]) :- generateP1(T, P), \+ mySame(T,P).
generateP1([X,Y|T], [XP,YP|T]) :- XP is X - 1, YP is Y + 1, X > 0, X =< 3.
generateP1([X,Y,Z|T], [XP,Y,ZP|T]) :- XP is X - 1, ZP is Z + 1, X > 0, X =< 3, Y =< 1.
generateP1([X,Y,Z,Q|T], [XP,Y, Z, QP|T]) :-  XP is X - 1, QP is Q + 1, X > 0, X =< 3, Y =< 1, Z =< 1.

% RULE 2
% only moves right one or two positions
% where dst must be 1 after move and while moving all fields should be <= 2

generateP2([],[]).
generateP2([H|T],[H|P]) :- generateP2(T,P), \+ mySame(T,P).
generateP2([X,Y|T], [XP,YP|T]) :- XP is X - 1, YP is Y + 1, X > 0, X =< 2, Y = 0.
generateP2([X,Y,Z|T], [XP,Y,ZP|T]) :- XP is X - 1, ZP is Z + 1, X > 0, X =< 2, Y =< 1, Z = 0.

% GAME

moveP1(A) :- write(A), generateP1(A, M), \+ moveP2(M), write(M). % is player 1 winning for this state A
moveP2(A) :- write(A), generateP2(A, M), \+ moveP1(M), write(M). % is player 2 winning for this state A

play(A) :- moveP1(A).
