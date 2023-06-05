fun factor(x:int, y:int):bool = 
    if (x mod y = 0) then true
    else false;

(* TEST CASE
- factor(3,5);
val it = false : bool
- factor(4,2);
val it = true : bool 
*)

fun prime(x:int):bool =
    if (x < 2) then false
    else
        let
            fun helper(y:int):bool =
                if (y = x) then true
                else if (x mod y = 0) then false
                else helper(y + 1)
        in
            helper(2)
        end;

(* TEST CASE
- prime(1);
val it = false : bool
- prime(101);
val it = true : bool 
*)

fun gcd(x:int, y:int):int = 
    if (y = 0) then x
    else gcd(y, x mod y);

(* TEST CASE
- gcd(10,100);
val it = 10 : int
- gcd(100,101);
val it = 1 : int
*)

fun perfect(x:int):bool =
    let
        fun helper(y:int, total:int):bool = 
            if (y > x div 2) then
                if (total = x) then true
                else false
            else if (x mod y = 0) then helper(y + 1, total + y)
            else helper(x + 1, total)
    in
        helper(1, 0)
    end;

(* TEST CASE
- perfect(6);
val it = true : bool
- perfect(12);
val it = false : bool
*)

fun amicable(x:int, y:int):bool = 
   let 
       fun helper1(i:int, total:int) = 
           if (i > x div 2) then total 
           else if (x mod i = 0) then helper1(i + 1, total + i)
           else helper1(i + 1, total)
       val a = helper1(1, 0)
       fun helper2(i:int, total:int) = 
           if (i > y div 2) then total 
           else if (y mod i = 0) then helper2(i + 1,total + i)
           else helper2(i + 1, total)
       val b = helper2(1, 0)
   in
       if (a = y andalso b = x) then true
       else false
   end;

(* TEST CASE
- amicable(220,284);
val it = true : bool
- amicable(33,56);
val it = false : bool
*)

fun occr(nums:int list, x:int):int = 
    let
        fun helper(nums: int list, total:int):int =
            if null nums then total 
            else if (hd(nums) = x) then helper(tl(nums), total + 1)
            else helper(tl(nums), total)
    in
        helper(nums, 0)
    end;

(* TEST CASE
- occr([1,1,1,2,3,4],1);
val it = 3 : int
- occr([2,3,4,5],6);       
val it = 0 : int
*)

fun primes(nums:int list):int list = 
   let 
       fun helper(nums:int list ,sol:int list) = 
           if null nums then rev(sol)
           else if (prime(hd(nums))) then helper(tl(nums), hd(nums)::sol)
           else helper(tl(nums), sol)
   in
       helper(nums,[])
   end;

(* TEST CASE
- primes([2,3,4,5,6,7]);
val it = [2,3,5,7] : int list
- primes([1,4,6]);
val it = [] : int list
*)

fun primeFactors(x:int):int list = 
    if (x < 2) then []
    else
        let 
            fun helper(i:int, sol:int list):int list = 
                if (i > x) then rev(sol)
                else if (x mod i = 0 andalso prime(i)) then helper(i + 1, i::sol)
                else helper(i+1, sol)
        in
            helper(2,[])
        end;

(* TEST CASE
- primeFactors(101);
val it = [101] : int list
- primeFactors(15);
val it = [3,5] : int list
- primeFactors(33);
val it = [3,11] : int list
- primeFactors(1);
val it = [] : int list
*)