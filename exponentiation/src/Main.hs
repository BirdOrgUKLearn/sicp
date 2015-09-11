{-# LANGUAGE MultiWayIf #-}
module Main where

import Criterion.Main

square :: Integer -> Integer
square x = x * x

expt :: Integer -> Integer -> Integer
expt b n = case n of
  0 -> 1
  _ -> b * expt b (n - 1)

expt' :: Integer -> Integer -> Integer
expt' b n = exptIter b n 1

exptIter :: Integer -> Integer -> Integer -> Integer
exptIter b counter prod = case counter of
  0 -> prod
  _ -> exptIter b (counter - 1) (b * prod)

fastExpt :: Integer -> Integer -> Integer
fastExpt b n =
  if | n == 0    -> 1
     | even n    -> square $ fastExpt b (n `div` 2)
     | otherwise -> b * fastExpt b (n - 1)

main :: IO ()
main = defaultMain [ bgroup "Exponentiation Even" [ bench "expt" $ nf (expt 2) 200000
                                                  , bench "expt'" $ nf (expt' 2) 200000
                                                  , bench "fastExpt" $ nf (fastExpt 2) 200000
                                                  ]
                   , bgroup "Exponentiation Uneven" [ bench "expt" $ nf (expt 2) 200001
                                                    , bench "expt'" $ nf (expt' 2) 200001
                                                    , bench "fastExpt" $ nf (fastExpt 2) 200001
                                                    ]
                   ]
