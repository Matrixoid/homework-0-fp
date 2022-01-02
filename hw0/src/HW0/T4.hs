module HW0.T4 where

import Data.Function (fix)
import Numeric.Natural (Natural)

repeat' :: a -> [a]
repeat' x = fix (x:)

map' :: (a -> b) -> [a] -> [b]
map' = fix map'' where
 map'' ::  ((a -> b) -> [a] -> [b]) -> (a -> b) -> [a] -> [b]
 map'' _ _ [] = []
 map'' f func (x : list) = func x : f func list

fib :: Natural -> Natural
fib = fix fib'
  where 
    fib' :: (Natural -> Natural) -> Natural -> Natural
    fib' _ 0 = 1
    fib' _ 1 = 1
    fib' f n = f (n - 1) + f (n - 2)

fac :: Natural -> Natural
fac = fix fac'
  where
    fac' :: (Natural -> Natural) -> Natural -> Natural
    fac' _ 0 = 1
    fac' _ 1 = 1
    fac' f n = f (n - 1) * n