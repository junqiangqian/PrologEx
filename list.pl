/* Question 1 */

all_members([], _).
all_members([X|XS], Y) :-
  member(X, Y),
  all_members(XS, Y).