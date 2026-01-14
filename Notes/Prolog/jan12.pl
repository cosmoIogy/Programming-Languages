/* 
Lecture 2-2: Prolog Goals and Predicates

Let's now understand how programming in a logic style like prolog works. This style has three steps
	1. Declare facts
	2. Define rules
	3. Ask questions (which means that after we load a file/databaseinto the prolog interpreter, we type in GOALS to see if they unify with the code in the file.)
Let's trace through our first Star Wars example code and understand how it worked.
*/
parent(anakin,luke).
parent(anakin,leia).
parent(padme,luke).
parent(padme,leia).
parent(leia,ben).
parent(han,ben).
grandparent(X,Y) :- parent(X,Z), parent(Z,Y).
/*
Lines 10 - 15 : Declaring facts.
Line 16 : Defing rules
Now calling the consult predicate in the interpreter will load this file and then we type in goals for step 3.

When you type a goal into the interpreter it will attempt to unify the goal with the code. 

Let's look at some examples of Goals
? - parent(anakin,luke).
	Response is true because it successfully unifies with Line 10.
	
? - parent(anakin,C).
	Unifies with line 12 and variable C is instantiated to luke
	
	Note that the interpreter is waiting for user action. There are possibly more options, so tell it if:
		; (redo and look for more matches)
		. (Stop and give next prompt)
		
		
? - grandparent(A,ben).
	The first and only match is line 18. The :- is pronounced "if". Then X is unified/bound
	with A and Y is unified/bound to ben. Then prolog will try to unify all the goals to the
	right side of :-, which are 
		parent(A,Z), parent(Z,ben)
	The first match is line 10 and we get
		parent(anakin,luke), parent(luke,ben)
	but then parent(luke,ben) fails. Now prolog will backtrack to the previous goal and
	attempt to unify again.
	
	Next match is Line 11 and we get
		parent(anakin,leia), parent(leia,ben)
	Now parent(leia,ben) succeeds on line 14. RHS of :- succeeds. Now prolog reports any 
	successful binding in your original goal or just true if no bindings.
	
	Next we hit the semicolon, which forces prolog to fail and backtrack. Next match is line 12 and
	we get
		parent(padme,luke), parent(luke,ben)
	Then parent(luke,ben) fails and backtracks to line 15 to get
		parent(padme,leia), parent(leia,ben)
	Now parent(leia,ben) succeeds and the result is
		A = padme
	Next put a semicolon for force fail and backtrack. Next match is
		parent(leia,ben), parent(ben,ben)
	Then parent(ben,ben) fails and we move only
		parent(han,ben), parent(ben,ben)
	Then parent(ben,ben) fails and backtrack, and no more matches. So the final result is false/fail.

	Ex. Suppose prolog has read the following file (database) 
*/ 
boy(alex).
boy(brandon).
girl(claire).
girl(denise).
couple(X,Y) :- boy(X),girl(Y).

/*Predict the response from prolog interpreter to the following goals.

? - boy(alex).
true
? - boy(jason).
false /* Note: The database is exclusive! Only facts declared are considered true 

? - girl(G).
G = claire;
G = denise

? - couple(alex,G).
G = claire;
G = denise

? - couple(B,alex).
false

? - couple(B,G).
B = alex,
G = claire;
B = alex,
G = denise;
B = brandon,
G = claire;
B = brandon,
G = denise
*/
