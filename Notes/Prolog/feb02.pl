/* 
Section 2.4 - Data Structures (Lists)

There are two main ways to construct a list in prolog:
    * put prolog terms with brackets sepearted by commas. for example,
        [jason,likes(caleb,cs),42]
    * uses cons operator | for a term and a list of terms. for example,
        [H|T] where H is the head and T is the tail of the list. If T is empty list,
        then the list has only one element H.
            For example, the list [jason,likes(caleb,cs),42] can also be written as
            [jason|[likes(caleb,cs),42]]

NOTE: At the end of every prolog list is the empty list [].

BUILT-IN PREDICATES FOR LISTS

length/2
    length([2,3,5,7],R)
    R = 4.

    The first argument is a list, second argument unifies with the length of the list

    Length is a predicate not a function 

append/3
    append([1,2],[3,4],R)
    R = [1,2,3,4].

    The first two arguments are lists, the third argument unifies with the concatenation
    of the first two lists.

    Append is a predicate not a function

last/2
    last([a,b,c,d],R)
    R = d.

    The first argument is a list, the second argument unifies with the last element of the list

    Last is a predicate not a function

select/3
    First argument is an element of a list, second argument is a list,
    and the third argument is unified with the last after the element has been removed
    (one at a time with backtracking)
    select(a,[a,b,c],R)
    R = [b,c] ;

member/2
    Succeeds when the element in the first argument is a member of the list in the second argument

reverse/2
    First argument is a list, second argument is unified with the reversal of the list

maplist/3
    First argument is a functor (representing a function), the second argument is a list ,
    the third argument is unified with the list after the function is applied to each value
 
foldl/4
    First argument is a functor (representing a two-variable accumulation function), the second
    argument is a list, the third argument is the initial value, and the fourth argument is unified
    with the result

Rev. Ex. The ML code to add all intergers in a list using foldl:
    - foldl ( fn (cv,acc) => cv + acc ) 0 [2,3,5,7];

ex. do the prolog version

Ex. (in-class) use the foldl and atomic_concat predicates to concatenate all atoms in the list
    [a,b,c,d,e]

    for example,
    ?- foldl(<?>)
    ?- foldl(atomic_concat,[a,b,c,d,e],``,R).
    R = abcde.



Ex. (in-class) use foldl (and construct and accumulation functor) to obtain the largest value in a list
of numbers. for example,

    ?- foldl(<?>,[2,3,5,7,4,6],<?>,R).
    ?- foldl(maxfun,[2,3,5,7,4,6],0,R).

    R = 7.



*/

myfun(X,R) :- R is X*X.

maplist(myfun,[2,3,5,7],R).
R = [4,9,25,49].

notfun(CV,ACC,R) :- R is CV + ACC.

foldl(notfun,[2,3,5,7],0,R).
R = 17.