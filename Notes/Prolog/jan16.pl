/* 
Command to load prolog file:
alt + x, L

Lecture 2-3: Prolog Operators and Arithmetic (Math)
A new built-in predicate to define your own operators is op/3.
The syntax is:
    op<precedence>, <type>, <name>)

    precedence: Integer value that defines the priority of the operator. The lower the number, the higher
    the priority. (More important when you have to deal with multiple operators)

    type: An atom that describes the operator type, some shoices are:
        yfx: infix, left associative
        fy: unary prefix associative
        yf: unary postfix associative

        name: an atom for the name of the operator you are defining

*/
% we will define a likes operator to mimic human speech
?- op(150, yfx, likes).

likes(caleb,cs).

% ? - op()

/* NOTE: Operators can still be used in the original way with the functor before the paranethesis.
Ex. likes(caleb,cs).
caleb likes cs.

Now that we've seen how to define our own operators, we can now offically learn about more built-in
operators avaliable to us.

BUILT-IN OPERATORS FOR TERMS

NAME: =
TYPE: infix
SYNTAX: <term1> = <term2>
DESCRIPTION: Unifies term1 and term2. Succeeds when the terms unify.

NAME: ==
TYPE: infix
SYNTAX: <term1> == <term2>
DESCRIPTION: Tests whether term1 and term2 are identical. Succeeds when the terms are identical.

NAME: \=
TYPE: infix
SYNTAX: <term1> \= <term2>
DESCRIPTION: Tests whether term1 and term2 are not unifiable. Succeeds when the terms do not unify.

BUILT-IN OPERATORS FOR NUMBERS
Let's list the standard/usual operators that similar in other lanugages:
    + plus
    - minus
    * multiply
    / divide
    // integer division
    ^ exponentiation (power)
    ** exponentiation (power)
    abs/1 absolute value
    max/2 max of two values
    min/2 min of two values
    sqrt/1 square root of 1 value
    cos/1 cosine of 1 value
    sin/1 sine of 1 value
    pi value of pi
    rem/2 remainder of the division of two integers

NOTE: These operators are NOT PREDICATES! Remember that goals typed into the prolog interpreter must
succeed or fail (be true or false)

When  you want to do arithmetic in prolog, you need a special predicate/operator to execute it (tell prolog
you're gonna do math!)

NAME: is
TYPE: infix
SYNTAX: <term> is <Arithmetic Expression>
DESCRIPTION: The arithmetic expression is evaluated and then is unified with the term 


BUILT-IN OPERATORS FOR LOGIC  
    ,   and
    ;   or (not commonly used)
    not not

BUILT-IN OPERATORS FOR COMPARISON
    <   less than
    >   greater than
    >=  greater than or equal to
    =<  less than or equal to
    |   is not arithemetically equal to 
    =:= is arithmetically equal to

NOTE: These ARE predicates 

Note: When writing prolog rules, it is custom to never use ; because it makes code 
more complicated and because its not necessary since we only need another line of code. For example:

parent(X,Y) :- father(X,Y); mother(X,Y).

is it not preferred! Instead, do this:

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

Now we can use these new operators to write better prolog progams

Ex. Suppose that prolog has read the following database:
*/

inOffice(trump,2025,2028).
inOffice(biden,2021,2024).
inOffice(trump,2017,2020).
inOffice(obama,2009,2016).
inOffice(bush43,2001,2008).
inOffice(clinton,1993,2000).
inOffice(bush41,1989,1992).
prez(X,Y) :- inOffice(X,A,B), Y>=A, Y=<B.

/* Predict the output to the following prolog goals:

inOffice(obama).
error

inOffice(obama,2010,2011).
false

inOffice(obama,M,N).
M = 2009,
N = 2016.

prez(obama,2011).
true.

prez(P,2019).
P = trump ;

This last example shows how you could write a predicate to instantiate a presidents name given
a year he was in office

prez(obama,N). is an instation error. 


