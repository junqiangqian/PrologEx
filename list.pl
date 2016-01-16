/* Question 1 */

all_members([], _).
all_members([X|XS], Y) :-
  member(X, Y),
  all_members(XS, Y).

/* Question 2 */

/* Non tail recursive */
pairs([], []).

pairs([X|XS], Y) :-
  U is X - 1,
  V is X + 1,
  pairs(XS, R),
  append([(U,V)], R, Y).

/* Tail recursive */
pairsTR([], []).
pairsTR([H|T], [(U,V)|Y]) :-
  U is H - 1,
  V is H + 1,
  pairsTR(T, Y).

/* Question 3 */

arbpairs(X,Y) :- apairs(X, [], Y).
apairs([], A, A).
apairs([H|T], A, Y) :-
  append(A, [(H, H)], UA),
  apairs(T, UA, Y);
  L is 2 * H,
  append(A, [(H, L)], UA),
  apairs(T, UA, Y).

/* Question 4 */

/* Recursive version */

replace_wrap(X, Y) :- rwrap(X, [], Y).
rwrap([], A, A).
rwrap([H|T], A, Y) :-
  append(A, [wrap(H)], UA),
  rwrap(T, UA, Y).

/* Findall version */

replace_wrap_FA(X, Y) :- findall(wrap(E), member(E, X), Y).

/* Question 5 */

even_members(X, Y) :- em(X, odd, Y).
em([], _, []).
em([_|T], odd, Y) :- em(T, even, Y).
em([H|T], even, [H|Y]) :- em(T, odd, Y).

/* Question 6 */

odd_even_members(X, Y, Z) :- oem(X, odd, Y, Z).
oem([], _, [], []).
oem([H|T], odd, [H|Y], Z) :- oem(T, even, Y, Z).
oem([H|T], even, Y, [H|Z]) :- oem(T, odd, Y, Z).

/* Question 7 */

numval(X, V) :-
  number(X),
  V is X.
numval(a(X, Y), V) :-
  numval(X, XV),
  numval(Y, YV),
  V is XV + YV.
numval(m(X,Y), V) :-
  numval(X, XV),
  numval(Y, YV),
  V is XV * YV.




















