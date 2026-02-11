myfun(N,R) :- integer(N), N>2, N1 is N-1, N2 is N-2, myfun(N1,R1), myfun(N2,R2), R is R1+R2.
myfun(1,4).
myfun(2,5).