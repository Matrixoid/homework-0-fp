{-# LANGUAGE TemplateHaskell, MagicHash #-}

import Control.Monad (unless)
import System.Exit (exitFailure)
import qualified Test.QuickCheck as QC
import Numeric.Natural (Natural)
import qualified Data.Char as Char
import GHC.Exts (Int(I#), reallyUnsafePtrEquality#)

---------------------------
------ NAME CHECKING ------
---------------------------

import HW0.T4 (repeat')
import HW0.T4 (map')
import HW0.T4 (fib)
import HW0.T4 (fac)

---------------------------
------ TYPE CHECKING ------
---------------------------

repeat'' :: a -> [a]
repeat'' = repeat'

map'' :: (a -> b) -> [a] -> [b]
map'' = map'

fib' :: Natural -> Natural
fib' = fib

fac' :: Natural -> Natural
fac' = fac

---------------------------
------ PROP CHECKING ------
---------------------------

prop_weak_repeat :: QC.Positive (QC.Small Int) -> Int -> Bool
prop_weak_repeat (QC.Positive (QC.Small n)) x =
  take n (repeat' x) == replicate n x

prop_repeat :: Bool
prop_repeat =
  case repeat' x of
    [] -> False
    r@(x' : r') ->
      x' == x
        &&
      I# (reallyUnsafePtrEquality# r r') == 1
  where
    x :: Int
    x = 0

prop_map :: [Int] -> Bool
prop_map xs =
    map' f xs == map f xs
  where
    f = (*2)

prop_fac :: Bool
prop_fac =
  map fac [0..25]
    ==
  [ 1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600,
    6227020800, 87178291200, 1307674368000, 20922789888000, 355687428096000,
    6402373705728000, 121645100408832000, 2432902008176640000,
    51090942171709440000, 1124000727777607680000, 25852016738884976640000,
    620448401733239439360000, 15511210043330985984000000 ]

return []

main :: IO ()
main = do
  ok <- $(QC.quickCheckAll)
  unless ok exitFailure
