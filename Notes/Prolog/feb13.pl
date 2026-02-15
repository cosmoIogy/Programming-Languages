/*
Continue Section 2.6

BUILT-IN PREDICATES FOR INPUT/OUTPUT STREAMS

Reading/Writing to files is similar to what we did before. The big difference is that you call built-in
predicates to change the source and target!

NAME: seeing/1
SYNTAX: seeing(<TERM>)
    The term is unified with the current input stream.

NOTE: The default input and output streams is 'user' for the terminal

NAME: telling/1
SYNTAX: telling(<TERM>)
    The term is unified with the current output stream.

NAME: see/1
SYNTAX: see(<TERM>)
    Change the input stream to the stream (file) represented by <TERM>

NAME: tell/1
    Change the output stream to the stream (file) represented by <TERM>

NAME: seen/0
    Closes the current input stream and resets to default

NAME: told/0
    Closes the current output stream and resets to default.

Ex. Here is a small example of writing to a file.
*/

gothree :- tell('gofour.txt'), write('lane hates jason.'), nl, nl, put(97), told.

/*
Ex. (In-Class) Write a prolog program that takes two file names in its arguments, then will read four prolog terms from the input file in the first
argument, and then write them to the output file in the second argument. For example.
    ?- launch('gofive.txt','target.txt')

    Then target file will have the four words from the source file on new lines.
*/

launch(InFile,OutFile) :- see(InFile), tell(OutFile), read(X), write(X), nl, read(Y), 
                        write(Y), nl, read(Z), write(Z), nl, read(A), write(A), nl, seen, told.

/* 
If we don't know the contents of the file in advance, then we must handle how our built-in predicates respond to reaching the end of a file
and how to program reading recursively.

    read(X): X unifies with 'end_of_file'
    get0(X) or get(X): 

Ex. Write a recursive program that will read all the integer terms in a file and then print the result to the terminal. For example,
    ?- gosum('nums.txt').
    55
    true
*/

gosum(Filename) :- see(Filename), tell(user), read(X), summing(X,0,R), write(R), nl, seen, told.

summing(end_of_file,S,S).

summing(X,N,R) :- X \= end_of_file, R1 is N+X, read(Y), summing(Y,R1,R).

