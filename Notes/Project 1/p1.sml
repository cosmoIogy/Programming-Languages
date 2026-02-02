(* 
Blair Bourque
1/12/26
CSC3303 002
Winter Quarter
Project #1
*)

datatype bst = Empty | Node of int * bst * bst

fun parseLine line =
    let
        val tokens = String.tokens (fn c => c = #",") line

        fun stripSpaces s =
            String.implode (List.filter (fn c => not (Char.isSpace c))
                                        (String.explode s))

        fun toInt s =
            case Int.fromString (stripSpaces s) of
                SOME n => n
              | NONE => 0  (* guaranteed valid per spec *)
    in
        if tokens = [""] then []
        else map toInt tokens
    end


fun insert (x, Empty) = Node (x, Empty, Empty)
  | insert (x, Node (v, left, right)) =
        if x < v then
            Node (v, insert (x, left), right)
        else if x > v then
            Node (v, left, insert (x, right))
        else (
            print ("Warning: duplicate " ^ Int.toString x ^ "\n");
            Node (v, left, right)
        )

fun buildTree lst =
    foldl (fn (x, t) => insert (x, t)) Empty lst

fun loadTrees filename =
    let
        val ins = TextIO.openIn filename

        fun loop acc =
            case TextIO.inputLine ins of
                NONE => acc
              | SOME line =>
                    let
                        val nums = parseLine line
                        val tree = buildTree nums
                    in
                        loop (tree :: acc)
                    end

        val result = loop []
        val _ = TextIO.closeIn ins
    in
        List.rev result
    end

fun findMin (Node (v, Empty, _)) = v
  | findMin (Node (_, left, _)) = findMin left

fun delete (x, Empty) = (
        print ("Warning: not found " ^ Int.toString x ^ "\n");
        Empty
    )
| delete (x, Node (v, left, right)) =
    if x < v then
        Node (v, delete (x, left), right)
    else if x > v then
        Node (v, left, delete (x, right))
    else
        case (left, right) of
            (Empty, Empty) => Empty
            | (Empty, _) => right
            | (_, Empty) => left
            | _ =>
                let
                    val m = findMin right
                in
                    Node (m, left, delete (m, right))
                end

fun inorder Empty = []
  | inorder (Node (v, l, r)) =
        inorder l @ (v :: inorder r)

fun preorder Empty = []
  | preorder (Node (v, l, r)) =
        v :: (preorder l @ preorder r)

fun postorder Empty = []
  | postorder (Node (v, l, r)) =    
        postorder l @ (postorder r @ [v])  

