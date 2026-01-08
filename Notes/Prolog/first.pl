parent(anakin, luke).
parent(anakin, leia).
parent(padme, luke).
parent(padme, leia).
parent(leia,ben).
parent(han, ben).
grandfather(X, Y) :- parent(X, Z), parent(Z, Y).

