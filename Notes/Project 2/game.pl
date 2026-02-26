/*
Name(s): Blair Bourque
Email(s): bbb023@latech.edu
Date: 2/25/26
Course Number and Section: CSC 3303 002
Quarter: Winter
Project #2
*/

/* 
To start:
?- start('log.txt').
*/

/* 
Elements implemented:
        Locked door: vault needs keycard
        Hidden object: keybard is hidden inside cabinet
        Limited resouce: oxygen, depletes by 1 with every move 
*/

:- dynamic i_am_at/1, at/2, holding/1. 
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)). 

i_am_at(someplace).

path(someplace, n, someplace).

at(thing, someplace).

/* These rules describe how to pick up an object. */

take(X) :-
        holding(X),
        write('You''re already holding it!'),
        !, nl.

take(X) :-
        i_am_at(Place),
        at(X, Place),
        retract(at(X, Place)),
        assert(holding(X)),
        write('OK.'),
        !, nl.

take(_) :-
        write('I don''t see it here.'),
        nl.


/* These rules describe how to put down an object. */

drop(X) :-
        holding(X),
        i_am_at(Place),
        retract(holding(X)),
        assert(at(X, Place)),
        write('OK.'),
        !, nl.

drop(_) :-
        write('You aren''t holding it!'),
        nl.


/* These rules define the direction letters as calls to go/1. */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */

go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('You can''t go that way.').


/* This rule tells how to look about you. */

look :-
        i_am_at(Place),
        describe(Place),
        nl,
        notice_objects_at(Place),
        nl.


/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).


/* This rule tells how to die. */

die :-
        finish.


/* Under UNIX, the "halt." command quits Prolog but does not
   remove the output window. On a PC, however, the window
   disappears before the final output can be seen. Hence this
   routine requests the user to perform the final "halt." */

finish :-
        nl,
        write('The game is over. Please enter the "halt." command.'),
        nl.


/* This rule just writes out game instructions. */

instructions :-
        nl,
        write('Enter commands using standard Prolog syntax.'), nl,
        write('Available commands are:'), nl,
        write('start.             -- to start the game.'), nl,
        write('n.  s.  e.  w.     -- to go in that direction.'), nl,
        write('take(Object).      -- to pick up an object.'), nl,
        write('drop(Object).      -- to put down an object.'), nl,
        write('look.              -- to look around you again.'), nl,
        write('instructions.      -- to see this message again.'), nl,
        write('halt.              -- to end the game and quit.'), nl,
        nl.


/* This rule starts the game and prints out commands */

start(FileName) :-
    open(FileName, write, Stream),
    assert(log_stream(Stream)),
    init,
    write_log('Welcome to Cyber Lab Escape!'),
    write_log('Commands: go(Direction). take(Item). open(Object). use(Object). inventory. (or i.)'),
    look.


/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(someplace) :- write('You are someplace.'), nl.

