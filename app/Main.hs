module Main where

import           Control.Monad.Trans.State
import           Morra
import           System.IO

main :: IO ()
main = do
  hSetBuffering stdout NoBuffering
  printWelcomeMsg
  endState <- execStateT game (GameState 0 0 1)
  printWinMsg endState

printWelcomeMsg :: IO ()
printWelcomeMsg =
  putStrLn "-- P is Player\n\
           \-- C is Computer\n\
           \-- Player is odds, computer is evens.\n\
           \-- In each round, choose either 1 or 2.\n\
           \-- The computer will do the same, and if the sum\n\
           \-- is odd you win. If it is even, the computer wins.\n\
           \-- Best of five rounds! Go!"

printWinMsg :: GameState -> IO ()
printWinMsg (GameState p c r) = do
  putStrLn "\n ---------------------------"
  case compare p c of
    GT -> putStrLn "|    YOU WON! WOHOO!! 😃    |"
    LT -> putStrLn "|  YOU LOST. YOU SUCK!! 😂  |"
    EQ -> putStrLn "| It was a tie! Boring.. 😒 |"
  putStrLn " ---------------------------"
  putStrLn $ "Player total points: " ++ show p
  putStrLn $ "Computer total points: " ++ show c
