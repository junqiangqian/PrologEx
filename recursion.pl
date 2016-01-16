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

/* Question 7 */

add_poly(X, Y, P) :- add_p(X, Y, [], P).

add_p([], Y, Acc, P) :- append(Acc, Y, P).
add_p(X, [], Acc, P) :- append(Acc, X, P).
add_p([(C1, I1)|XS], [(C2, I2)|YS], Acc, P) :-
  I1 == I2,
  NewCoeff is C1 + C2,
  append(Acc, [(NewCoeff, I1)], UpdAcc),
  add_p(XS, YS, UpdAcc, P);
  I1 < I2,
  append(Acc, [(C2, I2)], UpdAcc),
  add_p([(C1, I1)|XS], YS, UpdAcc, P);
  I1 > I2,
  append(Acc, [(C1, I1)], UpdAcc),
  add_p(XS, [(C2, I2)|YS], UpdAcc, P).








