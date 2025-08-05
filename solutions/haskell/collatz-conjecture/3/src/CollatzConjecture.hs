module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n
  | n <= 0 = Nothing
  | n == 1 = Just 0
  | otherwise =
      succ <$> collatz (if even n then n `div` 2 else 3 * n + 1)