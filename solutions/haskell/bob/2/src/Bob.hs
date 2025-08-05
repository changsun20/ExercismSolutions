module Bob (responseFor) where

import Data.Char (isAlpha, isUpper)

responseFor :: String -> String
responseFor xs
  | isSilence xs = "Fine. Be that way!"
  | isYelling xs && isQuestion xs = "Calm down, I know what I'm doing!"
  | isQuestion xs = "Sure."
  | isYelling xs = "Whoa, chill out!"
  | otherwise = "Whatever."

isQuestion :: String -> Bool
isQuestion xs = last trimSuffix == '?'
  where
    trimSuffix = reverse . dropWhile (`elem` " \t") . reverse $ xs

isYelling :: String -> Bool
isYelling xs =
  let letters = filter isAlpha xs
   in not (null letters) && all isUpper letters

isSilence :: String -> Bool
isSilence xs = null xs || all (`elem` " \t\n\r") xs