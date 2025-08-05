module Darts (score) where

score :: Float -> Float -> Int
score x y = case distFromCircle x y of
    d | d <= 1    -> 10
      | d <= 5    -> 5
      | d <= 10   -> 1
      | otherwise -> 0

distFromCircle :: Float -> Float -> Float
distFromCircle x y = sqrt (x * x + y * y)