print("Hello world");

fun pchar c = print(str(c)^"\n");
pchar(#"D");

fun pbools [] = () 
|   pbools (x::xs) = (
    print(bool.toString(x)^"\n");
    pbools(xs)
);