/* 
Predicates (analogous to function in ML)
Predicates are expressions in prolog that evaluate to either true or false, aka, succeed or fail.
We will first look at built-in predicates, then construct our own.

BUILT-IN PREDICATES

halt/0
    Exits the interpreter

consult/1
    Loads a file/database into the interpreter 

write/1
    The argument is a prolog term and the predicate will write the term to the current output
    stream (terminal by default). Always succeeds except on backtracking.

nl/0
    Writes a newline to the current output stream. Always succeeds except on backtracking.

NOTE: 1. Every prolog predicates either succeeds/evaluates to true or fails/evaluates to false.
2. You can use write/1 and n1/0 to debug your code by displaying intermediate variable
binding during execution.

Ex. Rewrite the grandparent rule from the last star wars example so that it will also print
the intermediate successful parent bindings between the grandparent and grandchild. 
*/

parent(anakin,luke).
parent(anakin,leia).
parent(padme,luke).
parent(padme,leia).
parent(leia,ben).
parent(han,ben).

/* 
grandparent(X,Y) :- parent(X,Z), parent(Z,Y), write(Z).

The above line is correct, but lets adjust it so it looks nicer.
*/

grandparent(X,Y) :- parent(X,Z), parent(Z,Y), write(Y), write(' is a child of '), write (Z), 
    write(' who is a child of '), nl. 

/*
Lets practice writing our own rules/predicates to accomplish tasks. One tip is that when you write prolog
rules, think of it this way:
    <for this rule to succeed> :- <These goals must be satisfied>

Ex. To the previous example, add a predicate named isParent/1 that succeeds when its argument is the
parent of anyone in the database. For example,
?- isParent(ben).
false
?- isParent(padme).
true
*/

isParent(X) :- parent(X,Y). 

/* 
NOTE: A singleton variable means that a variable only appeared once and is not being used. 
The wild card symbol in prolog is _. Lets rewrite the line of code above: 
*/

isParent(X) :- parent(X,_).

/* 
Ex. Write a predicate named areSiblings/2 that succeeds when they share a parent. 
*/

areSiblings(X,Y) :- parent(P,X), parent(P,Y).

/*
Goal Satisfying Alogorithm (GSA)
1. Are there more goals?
    Yes: Go to step 2
    No: Success
2. Evaulate the next goal
    Success: Go to step 1
    Fail: Go to step 3
3. Are there previous goals?
    Yes: Step 4
    No: Fail
4. Backtrack to previous goals
    Yes: Go to step 1
    No: Fail

Now lets write more complicated predicates based on previously written predicates (that we can't see)

Ex. Suppose the following predicates have been defined properly 
    male(X).
    female(X).
    parent(X,Y).
    diff(X,Y) means X and Y are different people

Now use these predicates to write the following additional predicates. Note that one cannot be a mother, father,
etc. of oneself.
*/

mother(X,Y) :- female(X), parent(X,Y).
sisters(X,Y) :- famele(X), female(Y), diff(X,Y), parent(P,X), parent(P,Y).

/* NOTE: Prolog does ignore whitespace

Next, we will write some simple database functionality using predicate that only need to exploit
Porlog's unification process.

Ex. (Workday example) Suppose the Prolog has read a database with all class and faculity info at 
Louisiana Tech. The following is a SAMPLE of the hundreds of entries in the database.
*/

course(
    csc330,
    days(mwf),
    time(1400,1515),
    instructor(terry,jason),
    room(iesb224),
    section(002),
    quarter(winter2026)
).


course(
    csc430,
    days(mwf),
    time(1100,1215),
    instructor(mbachu,uj),
    room(neth114),
    section(001),
    quarter(winter2026)
).


course(
    engr221,
    days(mwf),
    time(1200,1315),
    instructor(reis,louis),
    room(iesb104),
    section(003),
    quarter(winter2026)
).


course(
    math245,
    days(tr),
    time(0800,0950),
    instructor(barron,brian),
    room(iesb589),
    section(001),
    quarter(winter2026)
).

/* Write prolog rules for the following tasks.

1. Write getRoomByClass/2, where the first argument is a class code and the second argument is matched
with the room the class is located in.

*/

getRoomByClass(Class,Room) -: course(
    Class,
    _,
    _,
    _,
    room(Room),
    _,
    _
)./* Write prolog rules for the following tasks