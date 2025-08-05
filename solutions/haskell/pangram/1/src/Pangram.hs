module Pangram (isPangram) where

import Data.Char (isAsciiUpper)

isPangram :: String -> Bool
isPangram text = all (`elem` lowerText) ['a' .. 'z']
  where
    lowerText = map toLower text
    toLower c
      | isAsciiUpper c = toEnum (fromEnum c + 32)
      | otherwise = c
