import Debug.Trace
n = 600851475143
sqrtn = 775146

isFactor n m = n `mod` m == 0

-- Idea: Write a recursive function 
-- This function repeatedly factorises the number s until it reaches 1
-- while keeping track of the biggest factor seen so far using x

mydivide :: (Integral b) => Int -> Int -> b
mydivide m n = (truncate $ (fromIntegral m)/(fromIntegral n))

biggestFactor :: Int -> Int -> Int
biggestFactor 1 x = x -- end when number becomes 1 since 1 has no factors
biggestFactor s x = biggestFactor (s `mydivide` currFact) $ max x (trace ("currFact " ++  show currFact) currFact)
   where currFact:_ = filter (isFactor s) [2..(trace ("currS " ++ (show s) ++ " currSqrt " ++ (show $ truncate $ sqrt $ fromIntegral s)) (truncate $ sqrt $ fromIntegral s))] ++ [fromIntegral s]

-- Have to add the ++ [fromIntegral s] in case s is a prime. Otherwise when s
-- is a prime, currFact will be null
-- currFact is just the smallest integer from [2..sqrt s] ++ [s] that divides s
-- cleanly

-- The fromIntegrals convert integers/int into Num

answer = biggestFactor n 0
