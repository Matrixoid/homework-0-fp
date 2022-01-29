module HW0.T6 where

import HW0.T1 (distrib)
import Data.Char (isSpace)

a = distrib (Left ("AB" ++ "CD" ++ "EF"))     -- distrib from HW0.T1
b = map isSpace "Hello, World"
c = if 1 > 0 || error "X" then "Y" else "Z"

a_whnf = (Left ("AB" ++ "CD" ++ "EF"), Left ("AB" ++ "CD" ++ "EF"))
b_whnf = [isSpace 'H', isSpace 'e', isSpace 'l', isSpace 'l', isSpace 'o', isSpace ',', isSpace ' ', isSpace 'W', isSpace 'o', isSpace 'r', isSpace 'l', isSpace 'd']
c_whnf = "Y"
