-- I have no clue how to do this in Haskell.
-- Do I use a list comprehension then reduce it?
-- Do I use pattern matching to implement recursive fib x?

-- I have decided to implement a fib x function first

--somehow must use Integral instead of Num, since Num doesn't implement Eq apparently
fib :: (Integral a) => a -> a 
fib 1 = 1
fib 2 = 2
fib n = (fib (n - 1) + fib (n - 2)) -- This is naive implementation

-- Now I want to lazily take from a fib list while it is less than 4 million
-- To get a fib list, I want to map fib to a range
-- After that I filter for even entries, then sum the whole thing
answer = sum $ filter even $ takeWhile (< 4000000) $ map fib [1..]
