module Main where

import           Morra

main :: IO ()
main = do
  printWelcomeMsg

printWelcomeMsg :: IO ()
printWelcomeMsg =
  putStrLn "-- P is Player\n\
           \-- C is Computer\n\
           \-- Player is odds, computer is evens.\n\
           \-- There are five rounds.\n\
           \-- In each round, choose either one or two.\n\
           \-- The computer will do the same, and if the sum\n\
           \-- is odd you win. If it is even, the computer wins."
