import           Morra
import           Test.Hspec

main :: IO ()
main = hspec $
  describe "gameOver" $
    it "is game over when player has 3p" $
      shouldBe (gameOver (GameState 3 1 4)) True
