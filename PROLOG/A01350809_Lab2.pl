/* Alfonso Díaz-Infante
 * A01350809
 *------------------------Any Positive-----------------*/

any_positive([H|T]):-
  H > 0, !; %Checks if the number is positive, if positive returns true
  any_positive(T). %Moves to next number if it is not.

/*Test Cases
 * any_positive ([-1,-2,3,-4]). -> True
 * any_positive ([-1,-2,-3,-4]). -> False
 * any_positive([0,0,0,0]). -> False
 *
 *-------------------------Substitute-----------------*/

substitute(_, _, [], []). % Base case, list is empty.

substitute(M, N, [M|T], [N|NT]):- !, % Checks if M and the head of the list are the same.
  substitute(M, N, T, NT). %If M and head are the same,

substitute(M, N, [H|T], [H|NT]):- % Continue if M and the head are different.
  substitute(M, N, T, NT).

/*Test Cases
 * substitute(2, 3, [1, 2, 2, 2, 3, 2], X).
 * substitute(1, 8, [1, 2, 2, 2, 3, 2], X).
 *
 *-------------------------Eliminate_duplicates-----------------*/

eliminate_duplicates([],[]).

eliminate_duplicates([H | T],List):-
     member(H, T), %'member' is a prolog keyword that will tell you if H is in the T list
     eliminate_duplicates(T, List).

eliminate_duplicates([H | T], [H|T1]):-
      \+member(H, T), %'\+' is a negation of a goal, like putting NOT, so if it normally fails it will succeed in this case
      eliminate_duplicates(T, T1).

/* Test Cases
 * eliminate_duplicates([a, a, a, a, b, c, c, a, a, d, e, e, e, e],X).
 * eliminate_duplicates([b, c, c, a, a, d, e, e, e, e],X).
 *
 *-------------------------Intersect-----------------*/

intersect([], _, []).

intersect([H_One|T_One], ListTwo, NewList):-
  member(H_One, T_One), !, % Prevents that the new list gets equal elements by ignoring any value in the first list that is repeated.
  intersect(T_One, ListTwo, NewList).

intersect([H_One|T_One], ListTwo, [H_One|NewList]):-
  member(H_One, ListTwo), !, % If the head of the first list is equal to any value of the second  list, it gets appended to the new list.
  intersect(T_One, ListTwo, NewList).

intersect([_|T_One], ListTwo, NewList):-
  intersect(T_One, ListTwo, NewList). % If the head of the first one isn't on the second one it gets  ignored.

/* Test Cases
 * intersect([a, b, c, d], [b, d, e, f], X).
 * intersect([a, b, c, d], [b, d, e, f], X).
 *
 *-------------------------Invert-----------------*/

invert([], []). % Base case is an empty list


invert([H|T], ReversedList):-
  append(NewList, [H], ReversedList), %append is a prolog keyword that will concatenate two lists and will return 'ReversedList'
  invert(T,NewList). %Call upon itself sending the Tail as the head and Newlist as the reversed list

/* Test Cases
 * invert([a, b, e, c, e],X).
 * invert([a, a, a, e, e, e],X).
 *
 *-------------------------Less_Than-----------------*/

less_than(_,[],[]). % Base case


less_than(N, [H|T], [H|NewList]):-
  H < N, % If the head of the list is smaller than N it gets appended to the new list
  less_than(N, T, NewList).


less_than(N, [_|T], NewList):-
  less_than(N, T, NewList). % If the head of the list is not smaller than N it will be ignored.

/* Test Cases
 * less_than(5, [1, 6, 5, 2, 7], X).
 * less_than(2, [1, 6, 5, 2, 7], X).
 *
 *-------------------------More_Than(or_equal)-----------------*/

more_than(_, [], []). % Base case: empty list.

more_than(N, [H|T], [H|NL]):-
  H >= N, !, % Append to new list if the Head is bigger or equal to N.
  more_than(N, T, NL).

more_than(N, [_|T], NL):-
  more_than(N, T, NL). % Ignore the element if the head of the first list is smaller than N.

/* Test Cases
 * more_than((5, [1, 6, 5, 2, 7], X).
 * more_than((5, [1, 6, 5, 2, 7], X).
 *
 *-------------------------Rotate-----------------*/

rotate(List, 0,List). %Base case whenever the number gets to 0

rotate([H|T], N, Rotated):-
  N > 0, %If N is bigger than 0
  B is N-1, %Counter
  append(T, [H], NewList), %append the Tail and the Head of the list to the new list
  rotate(NewList, B, Rotated).%Recursive call sending the new list and the rotated list

rotate(Original, N, Rotated):-
    N < 0, %If N is less than 0
    B is -N, %Counter
    rotate(Rotated, B, Original). %Recursive call switching the Lists

/* Test Cases
 * rotate([1, 6, 5, 2, 7], 3, X).
 * rotate([1, 6, 5, 2, 7], -3, X).
 * */
