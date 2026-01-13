(* 
Blair Bourque
1/12/26
CSC3303 002
Winter Quarter
Project #1
*)

datatype bst = Empty | Node of int * bst * bst

fun parseLine 