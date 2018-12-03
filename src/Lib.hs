module Lib
    ( someFunc
    ) where

someFunc :: IO ()
someFunc = putStrLn $ show $ fastfibs !! 500

-- n      -> 0, 1, 2, 3, 4, 5, 6,  7,  8,  9,  10, 11
-- Fib(n) -> 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144...
-- Fib(0) = 1
-- Fib(1) = 1
-- Fib(2) = 2 = 1 + 1 = Fib(1) + Fib(0)
-- Fib(3) = 3 = 2 + 1 = Fib(2) + Fib(1)

-- Fib(n) = Fib(n-1) + Fib(n-2)

-- 32bits haskell "Int"
-- 8bits
-- 2^8 - 1 == 255
-- 255 + 1 in 8 bit = 0
-- 254, 367, 005, 999
-- 999 + 1 = 1000 -> 1|000
-- 000
-- Integer has no upper bound.

fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fastfibs :: [Integer]
fastfibs = 1 : 1 : zipWith (+) fastfibs (tail fastfibs)

-- Fib(n)      -> 1, 1, 2, 3, 5,...
-- tail Fib(n) ->    1, 2, 3, 5,...
-- zipWith lst1 lst2.... (+)
-- zip + fibs tailfibs -> 1, 1+1=2, 1+2=3, 3+2 
-- fib 50 = fib 49 + fib 48
-- fib 50 = (fib 48 + fib 47) + (fib 47 + fib 46) 
-- fib 50 = ([fib 47 + fib 46] + [fib 46 + fib 45]) + ([fib 46 + fib 45] + [fib 45 + fib 44]) 
-- (fib 0 fib 1) = fib 2 