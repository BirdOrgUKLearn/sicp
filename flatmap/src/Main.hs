module Main where

import Data.List (unfoldr)
import Data.Maybe (listToMaybe)
import Control.Monad (join)

type PairSum = (Integer, Integer, Integer)

main :: IO ()
main = print $ primeSumPairs' 10

isPrimeSum :: (Integer, Integer) -> Bool
isPrimeSum (x, y) = isPrime (x + y)

mkPairSum :: (Integer, Integer) -> PairSum
mkPairSum (x, y) = (x, y, x + y)

flatMap :: Monad m => (a -> m b) -> m a -> m b
flatMap = (=<<)

primeSumPairs :: Integer -> [PairSum]
primeSumPairs n =
  fmap mkPairSum
    (filter isPrimeSum
      (flatMap (\i ->
        map (\j -> (i, j)) [1..(i - 1)])
      [1..n]))

primeSumPairs' :: Integer -> [PairSum]
primeSumPairs' n =
  mkPairSum <$> filter isPrimeSum
      ([1..n] >>= (\i -> [1..(n - 1)] >>= (\j -> pure (i, j))))

primeSumPairs'' :: Integer -> [PairSum]
primeSumPairs'' n =
  mkPairSum <$>
    filter isPrimeSum
      (do i <- [1..n]
          j <- [1..(i - 1)]
          return (i, j))

primeSumPairs''' :: Integer -> [PairSum]
primeSumPairs''' n =
  mkPairSum <$> filter isPrimeSum [(i, j) | i <- [1..n], j <- [1..(i - 1)]]

-- ------------------------------
-- Implementing `prime?` from 1.3
-- ------------------------------
isPrime :: Integer -> Bool
isPrime n = n > 1 && factors n == [n]

factors :: Integer -> [Integer]
factors n = unfoldr (\(d,n) -> listToMaybe [(x, (x, div n x)) | n > 1,
                           x <- [d .. isqrt n] ++ [n], rem n x == 0]) (2,n)
isqrt :: Integer -> Integer
isqrt n = floor . sqrt . fromIntegral $ n
