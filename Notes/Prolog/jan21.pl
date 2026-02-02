/* 
Continue Lecture 2.3

PREDICATES WITH "OUTPUT"
In prolog, when you want to write a "function" with "output", you write a predicate with an additional
argument that will unify with the desired result

Rev. Ex. In ML, write a function to simulate f(x) = 3x + 1

fun f x = 3 * x + 1;
- f 7 
val it = 22 : int

ex. Write a prolog predicate named myfun/2, where the first argument is in the input of the function
f(x) = 3x + 1, and the second argument unified with the output. 

For example,
    ? - myfun(7,Y);
    Y = 22.
*/

myfun(X,R) :- R is 3 * X + 1.

myfun(7,Y). 

/* 
Ex. Write a predicate named isEven/1 that succeeds when its argument is an even integer. For example,
    ? - isEven(4).
    true.
*/

isEven(X) :- 0 is rem(X,2).

/* 
A useful built-in predicate is integer/1, that succeeds when its argument is an integer. We can rewrite the last
example as */
isEven(X) :- integer(X), 0 is rem(X,2).

/* 
The following are useful built-in predicates for characters

NAME: char_code/2
SYNTAX: char_code(C,N)
Succeeds when character C corresponds to integer N. 

char_code(a,N).
N = 97.

NAME: atomic_concat/3
SYNTAX: atomic_concat(<atom1>, <atom2>, R)
Concatenates the atoms and unifies the result to R.

atomic_concat(ja,son,R).
R = jason.

Rev. Ex. Write the ML function toUpper.
fun toUpper c = chr(orf(c)-32); 

Ex. (In-Class) Write a prolog predicate named toUpper/2 where the first argument is a 
character (atom of length 1) and the second argument is unified with its uppercase version.
For example,
    ?- toUpper(d,R).
    R = 'D'.
*/

toUpper(C,R) :- char_code(C,N), N1 is N - 32, char_code(R,N1).
toUpper(d,R).

/* 
Errors:
    char_code(C,N-32).
    This gives an error because N-32 is not a valid term. We need to use is to evaluate arithmetic expressions.

    N is char_code(C,M).
    Right side of the is must be an arithmetic expression, but char_code(C,M) is a predicate that
    succeeds or fails, not an arithmetic expression.

    R = char_code(C,N).
    This gives an error because the = operator is for unification, but char_code(C,N) is a predicate
    that succeeds or fails, not a term.

 
Ex. (In-Class) Write a prolog predicate named past/2, where the first argument is an atom,
and the second argument is unified with the atom after 'ed' is concatenated at the end. For example,
    ?- past(box,R).
    R = boxed.
*/

past(X,R) :- atomic_concat(X,ed,R).
past(box,R).

/*
Ex. Write a predicate namd distance/3, where the first two arguments are points and the third 
argument is matched with the distance between them. For example,
?- distance((1,-2),(4,2),R).
R = 5.0.
*/

distance((X1,Y1),(X2,Y2),R) :- X is X2 - X1, Y is Y2 - Y1, R is sqrt(X^2 + Y^2). 
distance((1,-2),(4,2),R).

f(X,R) :- R is 3*X + 8.