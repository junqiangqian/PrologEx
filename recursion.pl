/* Question 1 */
arc(a, b).
arc(b, c).
arc(b, d).
arc(c, f).
arc(d, f).
arc(c, e).
arc(f, e).

path(X, Z) :- arc(X, Z).
path(X, Z) :-
  arc(X, Y),
  path(Y, Z).

/* Question 2 */

plus(0, N, N).
plus(s(N), M, s(T)) :-
  plus(N, M, T).

odd(s(0)).

odd(s(s(X))) :-
  odd(X).


/* Question 3 */

ones_zeroes([]).
ones_zeroes([1|Tail]) :- ones_zeroes(Tail).
ones_zeroes([0|Tail]) :- ones_zeroes(Tail).

/* Question 4 */

/* ';' is the or operator */

hasdup([X|XS]) :- member(X, XS)
  ; hasdup(XS).

/* Question 5 */

prod(L, R) :- prodHelper(L, 1, R).

prodHelper([], TOTAL, TOTAL).
prodHelper([X|XS], ACC, TOTAL) :-
  Prod is X * ACC,
  prodHelper(XS, Prod, TOTAL).

/* Question 6 */

contains(ML, SL, N) :-
  append(SL,_,T),
  append(Y,T,ML),
  length(Y,N).


