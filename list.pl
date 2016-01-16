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

