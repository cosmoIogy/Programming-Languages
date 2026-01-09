/* 
Every statement in prolog end with . 

Lecture 2-1: Prolog Unification 
Before we start coding prolog, there is an operator that we must learn how to use first 
    = 

Before this, lets learn about Prolog Terms,
which are the fundamental "buliding blocks" of a prolog program. he TERMS in prolog are 

NUMBERS 
ATOMS/CONSTANTS/LITERALS 
- Sequence of letters, numbers, underscores beginning with a lowercase letter
- Any sequence of characters surrounded by single quotes
- Sequeuence of special characters like =, +, @, etc (but users dont normally use these)

VARIABLES
- Sequence of letters, numbers, underscores beginning with an uppercase letter 

COMPOUND TERM have the form:
 <atom> (<sequence of prolog terms seperated by commas>)

Vocab : The atom at the begining of a compound term is called the functor 

Vocab: The "arity" of a compound term is the number of arguments/terms its parentheses. In 
written text, we can reference a compound term as <functor>/<arity>

Ex. The compoound terms in our first exmaple can be referred to as parent/2 and grandfather/2. 

Reserved words in prolog: true, false, fail 

UNIFICATION: 
Unification is the primary action that prolog does when it executres programs. The prolog unfix operator
for unifcation is =. The prolog operator for and is , 

The following is a description of how prolog unifies/matches terms:
 - Two atoms unify if and only if they are the same (literally) 
 - Two numbers unify if and only if they are the same
 - Two compound terms unify if and only if they have the same function, the same arity, and their 
argument unify pairwise (left-to-right) 
- An unbound variable and a term that is not a variable always unify, and the variable is bound to that 
term aka instantiation (true is in the background and prolog reports the instantiations)
- Two unbound variables always unify and are bound to each other
- A bound variable is treated as the value to which it is bound. 
- Any other combination of terms fails to unify

Note: The scope of variables ends at the period.

The possible responses to a unification are
    true 
    false
    <list of instantations>