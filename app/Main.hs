module Main where

main :: IO ()

hailstone :: Integer -> Integer
hailstone n
  | even n = n `div` 2
  | otherwise = 3 * n + 1

hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

main = do
  print (hailstoneSeq 5)
  print (hailstoneSeq 6)
