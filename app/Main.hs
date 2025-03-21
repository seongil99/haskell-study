module Main where

main :: IO ()

-- Week 2

data Thing = Shoe 
           | Ship 
           | SealingWax 
           | Cabbage  
           | King
  deriving Show

-- Week 1

hailstone :: Integer -> Integer
hailstone n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

-- Compute the length of a list of Integers.
intListLength :: [Integer] -> Integer
intListLength [] = 0
intListLength (_:xs) = 1 + intListLength xs

sumEveryTwo :: [Integer] -> [Integer]
sumEveryTwo [] = []         -- Do nothing to the empty list
sumEveryTwo [x] = [x]       -- Do nothing to lists with a single element
sumEveryTwo (x:(y:zs)) = (x + y) : sumEveryTwo zs

-- The number of hailstone steps needed to reach 1 from a starting
-- number.
hailstoneLen :: Integer -> Integer
hailstoneLen n = intListLength (hailstoneSeq n) - 1

main = do
  print (hailstoneSeq 5)
  print (hailstoneSeq 6)
  print (intListLength [1, 2, 3, 4, 5])
  print (sumEveryTwo [1, 2, 3, 4, 5])
  print (hailstoneLen 6)
