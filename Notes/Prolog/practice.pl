/* In Exercises 23-26, use the built-in predicate maplist/3 to perform the given task.
23. Given a list of numbers, obtain the list where each element is squared.
24. Given a list of ordered pairs of numbers, obtain the list where each element is the sum
of each ordered pair.
25. Given a list of atoms, obtain the list where each element is concatenated with 'ed'. You
may use the built-in predicate atomic_concat.
26. Given a list of lowercase characters (atoms of length 1) from the alphabet, obtain the list
where each character has been shifted to the previous character (a can be shifted to `).
*/

%23 
maplist(squared, List, SquaredList).
squared(X, Y) :- Y is X * X.

%24
maplist(sum_pairs, Pairs, Sums).
sum_pairs((X, Y), Sum) :- Sum is X + Y.

%25
maplist(concat_ed, Atoms, Concatenated).
concat_ed(Atom, Concatenated) :- atomic_concat(Atom, 'ed', Concatenated).

%26
maplist(shift_char, Chars, ShiftedChars).
shift_char(Char, ShiftedChar) :-
    char_code(Char, Code),
    ShiftedCode is Code - 1,
    char_code(ShiftedChar, ShiftedCode).

/* In Exercises 27-32, use the built-in predicate foldl/4 to perform the given task.
27. Given a list of numbers, obtain the sum of each number in the list.
28. Given a list of numbers, obtain the product of each number in the list.
29. Given a list of atoms, obtain the list in reverse order. (Do not use reverse.)
30. Given a list of positive numbers, obtain largest number in the list, or else 0 for empty
list.
31. Given a list of atoms, obtain the concatenation of all atoms in the list. You should use
the built-in predicate atomic_concat, but not atomic_list_concat.
32. Given a list of elements, obtain the list where each element has been duplicated.
*/

%27
foldl(sum, List, 0, Sum).
sum(X, Acc, NewAcc) :- NewAcc is Acc + X.

%28
foldl(product, List, 1, Product).
product(X, Acc, NewAcc) :- NewAcc is Acc * X.

%29
foldl(reverse_list, List, [], Reversed).
reverse_list(X, Acc, NewAcc) :- append([X], Acc, NewAcc).

% factoiral/2, where the second argument is matched the factorial value
% of the first argument. use recursion. for error checking, use the
% built-in predicate integer/1 to check if the first argument is a non-negative integer. if not, the predicate should fail.
/* for example:
?- factorial(4, R).
R = 24.
?- factorial(-1, R).
false.
*/

factorial(N,R) :- integer(N), N >= 0, factorial_helper(N, R).
factorial_helper(0, 1).
factorial_helper(N, R) :-
    N > 0,
    N1 is N - 1,
    factorial_helper(N1, R1),
    R is N * R1.

% how it works:
% factorial(4, R) calls factorial_helper(4, R)
% factorial_helper(4, R) calls factorial_helper(3, R1)
% factorial_helper(3, R1) calls factorial_helper(2, R2)
% factorial_helper(2, R2) calls factorial_helper(1, R3)
% factorial_helper(1, R3) calls factorial_helper(0, R4)
% factorial_helper(0, R4) returns R4 = 1
% factorial_helper(1, R3) returns R3 = 1 * 1 = 1
% factorial_helper(2, R2) returns R2 = 2 * 1 = 2
% factorial_helper(3, R1) returns R1 = 3 * 2 = 6   
% factorial_helper(4, R) returns R = 4 * 6 = 24

