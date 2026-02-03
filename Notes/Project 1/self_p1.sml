(* 
Blair Bourque
1/12/26
CSC3303 002
Winter Quarter
Project #1
*)

datatype bst = Empty | Node of int * bst * bst (* value, left subtree, right subtree *)

fun removeSpaces [] = [] (* helper function to remove spaces from a list of characters *)
  | removeSpaces (c :: cs) = 
        if Char.isSpace c then (* check if character is a space *)
            removeSpaces cs 
        else
            c :: removeSpaces cs (* keep character and continue *)

fun stripSpaces s =
    String.implode (removeSpaces (String.explode s)) (* removes all spaces from a string *)

fun toInt s =
    case Int.fromString (stripSpaces s) of (* removes spaces and converts to int option *)
        SOME n => n
      | NONE => 0   

(* Parseline Function *)
fun parseLine line =
    let
        val tokens = String.tokens (fn c => c = #",") line (* split line into tokens by comma *)

        fun convert [] = [] (* helper function to convert list of strings to list of integers *)
          | convert (x :: xs) =
                toInt x :: convert xs
    in
        if tokens = [""] then [] (* if the line is empty, return an empty list *)
        else convert tokens (* convert tokens to integers *)
    end


(* Inserts a value into the BST *)
fun insert (x, Empty) = Node (x, Empty, Empty) (* insert into empty tree *)
  | insert (x, Node (v, left, right)) = (* insert into non-empty tree *)
        if x < v then  
            Node (v, insert (x, left), right)
        else if x > v then 
            Node (v, left, insert (x, right)) 
        else (
            print (" Duplicate! " ^ Int.toString x ^ "\n"); 
            Node (v, left, right) (* do not insert duplicate *)
        )

(* Builds a BST from a list of integers *)
fun buildTree lst = 
    foldl (fn (x, t) => insert (x, t)) Empty lst (* builds a BST from a list of integers *)

(* Loads multiple trees from a file *)
fun loadTrees filename = (* loads multiple trees from a file *)
    let
        val ins = TextIO.openIn filename

        fun loop acc = (* helper function to read lines and build trees *)
            case TextIO.inputLine ins of 
                NONE => acc (* end of file, return accumulated list of trees *)
              | SOME line => 
                    let 
                        val nums = parseLine line (* parse the line into a list of integers *)
                        val tree = buildTree nums (* build a tree from the list of integers *)
                    in
                        loop (tree :: acc) (* continue looping with the new tree added to the accumulator *)
                    end

        val result = loop []
        val _ = TextIO.closeIn ins 
    in
        List.rev result (* reverse the list to maintain original order *)
    end

(* Find Minimum function *)
fun findMin (Node (v, Empty, _)) = v (* find minimum value in the BST *)
  | findMin (Node (_, left, _)) = findMin left (* recursively go left to find minimum *)

(* Delete function *)
fun delete (x, Empty) = ( (* delete from empty tree *)
        print (" Not found! " ^ Int.toString x ^ "\n"); 
        Empty
    )
| delete (x, Node (v, left, right)) = (* delete from non-empty tree *)
    if x < v then 
        Node (v, delete (x, left), right)
    else if x > v then
        Node (v, left, delete (x, right))
    else
        case (left, right) of (* node found, handle three cases *)
            (Empty, Empty) => Empty (* no children *)
            | (Empty, _) => right (* only right child *)
            | (_, Empty) => left  (* only left child *)
            | _ => 
                let        
                    val m = findMin right (* find minimum in right subtree *)
                in
                    Node (m, left, delete (m, right)) (* replace with min and delete min from right subtree *)
                end

(* Tree Traversals *)
fun inorder Empty = [] 
  | inorder (Node (v, l, r)) = (* visit left, root, right *)
        inorder l @ (v :: inorder r) (* concatenate lists *)

fun preorder Empty = [] 
  | preorder (Node (v, l, r)) = (* visit root, left, right *)
        v :: (preorder l @ preorder r) 

fun postorder Empty = []
  | postorder (Node (v, l, r)) = (* visit left, right, root *)
        postorder l @ (postorder r @ [v])  


