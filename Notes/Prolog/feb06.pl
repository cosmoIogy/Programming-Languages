/* 
Ex. Write a recursive prolog predicate named linearSearch/3, where the first argument is a list, the second argument
is the element of a list, and the third argument is unified with the position number. Assume starting position
be 1. If the element is not found, the third argument shall be -1.
*/

% Recursive cases
    % Head of list matches search 
    helper([X|T],X,N,N).
        % Head of list does not match search 
        helper([H|T],X,N,R) :- H \= X, N1 is N + 1, helper(T,X,N1,R).
% Base case
helper([],_,_,-1). % Item not found

% Front end
linearSearch(L,X,R) :- helper(L,X,1,R). % Pass data to helper along with current postion (starting at 1)

/*
Ex. Write a recursive prolog predicate named sortedMerge/3, where the first two arguments are sorted lists of numbers
and the third argument is matched with the combined sorted list. 

FYI, the ML code for sortedMerge is:

fun sortedMerge ([], L) = L
    | sortedMerge (M, []) = M
    | sortedMerge (L as x::xs, M as y::ys) = if x < y then x::sortedMerge(xs, M) else y::sortedMerge(L, ys);
*/

% Recursive case 
% sortedMerge([X|XS], [Y|YS], R) :- X < Y, sortedMerge(XS, [Y|YS], T), R = [X|T]. But this can be simplified to:
sortedMerge([X|XS], [Y|YS], [X|T]) :- X < Y, sortedMerge(XS, [Y|YS], T).
sortedMerge([X|XS], [Y|YS], [Y|T]) :- X >= Y, sortedMerge([X|XS], YS, T).

% Base cases 
sortedMerge([],L,L).
sortedMerge(M,[],M).

/* 
Ex. (in-class) Write the following recursive prolog predicates:
    1. ismember/2 (arguments are List, element of list)
    2. myAppend/3 () (arguments are two lists, then concatentation of them)
    3. listSum/2 (arguments are a list numbers, then their sum)
    4. removal/3 (arguments are a list, element of list, then the list after all those elements are removed)
Examples:
? - isMember([a,b,c,d], c). 
true

?- myAppend([b,a], [c,d,e], R)
R = [b,a,c,d,e]
*/ 

% #1

% Recursive Case
isMember([X|_],X) :- true.
isMember([H|T],X) :- H \= X, isMember(T,X). % if head of list does not match search, check tail of list

% Base Case
isMember([],_) :- false % list is empty

% #2

% Recursive Case
myAppend([X|XS], L, R) :- myAppend(XS, L, R1), R = [X|R1]. % if head of first list is X, then result is X followed by the result of appending tail of first list and second list
                                         

% Base Case
myAppend([],L,L).
myAppend(L,[],L).

% 3 

% listSum recursive case
listSum([H|T],R) :- listSum(T,R1), R is H+R1.

% listSum base case
listSum([],0).

% Exam 2 
% Sections: 2.5, 2.4, 2.3, 2.2, 2.1
