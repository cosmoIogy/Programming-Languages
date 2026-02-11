/*
Section 2-6: Prolog Input/Output

BUILT-IN PREDICATES FOR TERM IO

NAME: write/1
SYNTAX: write(<TERM>)
    -Writes the term to the current output stream. 

NOTE: The default input and output streams are the terminal, whos atom is 'user'

NAME: writeq/1
SYNTAX: writeq(<TERM>)
    -Acts just like write, except that atoms that need single quotes are included in the output 

NAME: nl/0
SYNTAX: nl
    -Writes a newline character to the current output stream

Ex: 
write(caleb),nl,write(rocks).
caleb
rocks
true.

NAME: read/1
SYNTAX: read(<TERM>)
    - Reads a prolog term from the current input stream. If the term is read from the terminal,
    it must be followed by return/enter. Then <TERM> is unified with the term that is read.

Ex:
read(caleb).
|: jason.
caleb = jason
false.

read(X).
|: jason.
X = jason.

Ex. Write a prolog program that asks the user for their name and greets you.

NOTE: This example is also a demo of how to "launch" a prolog program. It is custom to create a prolog atom
as a "starting goal" whose only purpose is to execute a series of prolog goals for the program.
*/

go :- write('What is your name? '), read(X), greet(X).

greet(caleb) :- write(' Hi caleb! You rock!'), nl.
greet(Y) :- Y \= caleb, write('Hi '), write(Y), write('.'), nl.

/*
BUILT-IN PREDICATES FOR CHARACTERS 

NAME: put/1
SYTAX: put(<INTEGER>)
    - Writes the corresponding character of the integer to the current output stream.
Ex:
put(97).
a
true.

NAME: get0/1
SYNTAX: get0(<TERM>)
    - Reads a single character from the current input stream. If read from the terminal, the character must be followed
    by enter/return. Then the integer value of the character is unfied with <TERM>.
Ex:
get0(X).
|: 

X = 32.

NAME: get/1
SYNTAX: get(<TERM>)
    - Acts just like get0, except ignored whitespace (<= 32)

Ex. Write a recursive prolog program that will read a series of characters from the terminal ending with *, and then prints
their integer values to the terminal. For example,
?- goto.
Enter a series of characters ending with *: ab*
97
98
<false?>
*/

goto :- write('Enter a series of characters ending with *: '), goread.

goread :- get0(X), process(X).

process(Y) :- Y \= 42, write(Y), nl, goread. 

/*
Ex. (In-class) write a recursive prolog program named charcount/1, the prompts the user to input a series of characters
ending with * and will unify its argument with the number of characters provided (not including *). For example,
?- charcount(R).
Enter a series of characters ending with * and I will count them: abcdefu* 
R = 7
*/

charcount(R) :- write('Enter a series of characters ending with * and I will count them: '), count(0,R). % Start count at 0 and unify R with the final count after processing the characters

% Read next char and process 
count(N, R) :- get0(X), process(X,N,R). % Read next char and process it with current count N and unify R with final count after processing the characters

% Processor base case
process(42, N, N). % If * is read, unify count with R

% Processor recursive case
process(X, N, R) :- X \= 42, N1 is N + 1, count(N1, R). % If not *, increment count and read next char