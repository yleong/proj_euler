-- First get a list of candidates
-- Then filter and take the max?
--
cartProd xs ys = [(x,y) | x <- xs, y <- ys]
candidates = cartProd [100..999] [100..999]

multiplyTuple (x, y) = x * y

-- compares 2 lists for equality
listEq [] [] = True
listEq [] _ = False
listEq _ [] = False
listEq (x:xs) (y:ys) = x == y && listEq xs ys

-- reverses a list. is this form tail recursive? yeah it is.
reverse' x = myreverse x []
myreverse [] x = x
myreverse (y:ys) x = myreverse ys (y:x)

-- finds the largest num in the list of natural nums
-- this is also tail recursive. yay
largest x = largest' x 0
largest' [] y = y
largest' (x:xs) y = largest' xs $ max x y

-- returns true if the integer x is a palindrome
palindrome x = listEq strx $ reverse' strx
   where strx = show x

answer = largest $ filter palindrome $ map multiplyTuple candidates
