import           Morra
import           Test.Hspec

main :: IO ()
main = hspec $
  describe "gameOver" $ do
    it "is game over when player has 3p" $
      gameOver (GameState 3 1 4) `shouldBe` True
    it "is not game over when both have 2p" $
      gameOver (GameState 2 2 4) `shouldBe` False
