module Morra where
import           Control.Applicative       (empty, liftA2, (<|>))
import           Control.Monad             (unless)
import           Control.Monad.IO.Class    (liftIO)
import           Control.Monad.Trans.State
import           System.Random             (randomRIO)

data GameState =
  GameState { playerPoints  :: Int
           , computerPoints :: Int
           , roundNum       :: Int }
  deriving (Eq, Show)

gameOver :: GameState -> Bool
gameOver (GameState p c r) =
  r > 5 || max p c > 5`div`2

readPlayerInput :: IO Int
readPlayerInput = do
  n <- readLn
  if n `elem` [1,2]
    then return n
    else empty

getPlayerNum :: IO Int
getPlayerNum = putStr "P: " >> readPlayerInput
  <|> (putStrLn "Please insert either 1 or 2." >> getPlayerNum)

getComputerNum :: IO Int
getComputerNum = do
  num <- randomRIO (1,2)
  putStrLn $ "C: " ++ show num
  return num

finishRound :: Int -> StateT GameState IO ()
finishRound sum' = do
  GameState p c r <- get
  if odd sum'
    then do liftIO $ putStrLn "You won the round!"
            put $ GameState (p+1) c (r+1)
    else do liftIO $ putStrLn "Computer won the round."
            put $ GameState p (c+1) (r+1)

round' :: StateT GameState IO ()
round' = do
  gameState <- get
  liftIO $ putStrLn ("\n----ROUND " ++ show (roundNum gameState) ++ "----")
  (pNum, cNum) <- liftIO $
    liftA2 (,) getPlayerNum getComputerNum
  finishRound (pNum+cNum)

game :: StateT GameState IO ()
game = do round'
          gameState <- get
          unless (gameOver gameState) game
