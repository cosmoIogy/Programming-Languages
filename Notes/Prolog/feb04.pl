/* 
Section 2.5: Prolog Recursion

Rev. Ex. The ML code for the recursive factorial function is:

    - fun fact 0 = 1
    -   | fact n = n * fact (n-1);

Ex. Write a recursive prolog predicate named fact/2 where the first argument is a non-negative integer and the second argument
is matched with its factorial value. For example,

?- fact(4,R).
R = 24.

*/

% Base Case
fact(0,1).

% Recursive Case
fact(X,R) :- X>0, X1 is X-1, fact(X1,R1), R  is X * R1.

/* 
Note: We can put the recursive case before the base case in the code to sometimes prevent unnecessary backtracking.

Ex. Write a recursive prolog predicatee named fib/2 where the first argument is a non-negative integer and the second argument
is unified with the corresponding fibonacci number. For example,
?- fib(5,R).
R = 8
? - fib(6,R).
R = 13
*/

% Recursive Case
fib(N,R) :- N>1, N1 is N-1, N2 is N-2, fib(N1, R1), fib(N2, R2), R is R1 + R2.

% Base cases

fib(0,1).
fib(1,1).

/* 
Write mutually recusrive prolog predicates isEven/1 and isOdd/1, where the argument is a non-negative integer and succeeds when the 
argument is even and odd, respectively, or else fails. For example,
?- isEven(4).
true.

FYI, the ML version we did was
    - fun isEven 0 = true
    -   | isEven n = isOdd (n-1)
    -
    - and isOdd 0 = false
    -   | isOdd n = isEven (n-1);
*/

% Recursive case
isEven(N) :- N>0, N1 is N-1, isOdd(N1).
isOdd(N) :- N>0, N1 is N-1, isEven(N1).

% Base cases
isEven(0).
% Base case for isOdd is NO CODE!

/*
Ex. Write your own length predicate. For example, 
?- mylength([a,b,c,d],R).
R = 4.
*/

% Recursive case
mylength([_|T],R) :- mylength(T,R1), R is R1 + 1.
% Base Case
mylength([],0).


/* 
Ex. Write a recursive prolog predicate named linearSearch/3, where the first argument is a list, the second argument
is the element of a list, and the third argument is unified with the position number. Assume starting position
be 1. If the element is not found, the third argument shall be -1. For example,

?- linearSearch([a,b,c,d],d,R).
R = 4.
?- linearSearch([a,b,c,d],e,R).
R = -1.

FYI, the ML code was 
(* BACK END *)
    - fun helper ([],_,n) = ~n-1
|   helper (y::ys, x, n) = if x=y then 1 else 1 + helper(ys,x,n);
    
(* FRONT END *)
    - fun linearSearch2 (L, x) = helper (L, x, length(L));
*/

% Recursive Case
helper([H|T],X,N,R) :- H=X , R=N.

% Base Case
helper([],_,_,-1). 
% Arguments are: List, Item im searching for, current position, answer

%Front end
linearSearch(L,X,R) :- helper(L,X,1,R).
