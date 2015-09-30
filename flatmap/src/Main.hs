module Main where

import Data.List (unfoldr)
import Data.Maybe (listToMaybe)

main :: IO ()
main = do
  print $ isPrimeSum (1, 2)

isPrimeSum :: (Integer, Integer) -> Bool
isPrimeSum (x, y) = isPrime (x + y)

-- Implementing `prime?` from 1.3

factors :: Integer -> [Integer]
factors n = unfoldr (\(d,n) -> listToMaybe [(x, (x, div n x)) | n > 1,
                           x <- [d .. isqrt n] ++ [n], rem n x == 0]) (2,n)

isPrime :: Integer -> Bool
isPrime n = n > 1 && factors n == [n]

isqrt :: Integer -> Integer
isqrt n = floor . sqrt . fromIntegral $ n
