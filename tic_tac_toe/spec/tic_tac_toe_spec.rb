require './tic_tac_toe'

# TODO:

describe "TicTacToe" do
  game = TicTacToe.new
  # test to see if board generated correctly
  describe  "#initialize" do
    it "returns a 3 by 3 grid" do
      expect(@board).to match_array([1,2,3,4,5,6,7,8,9])
    end
  end

  # test to see if turns alternate
  describe  "#determine_turn" do
    it "returns current player's turn" do
      @player1_turn = true
      expect(game.determine_turn).to eql("It is X's turn")
    end
  end

  describe  "#determine_turn" do
    it "returns current player's turn" do
      @player1_turn = false
      expect(game.determine_turn).to eql("It is O's turn")
    end
  end

  # test to check if input is valid
  describe "#player_move" do
    it "accepts only integers" do
      expect(@position).to be_a(Integer)
    end
  end
  # test to see if move valid
  describe "#move_valid?}" do
    it "returns true if ..." do
      expect(game.move_valid?).to eql(true)
    end
  end
end






# test to check win conditions
    # 1. three in a row horizontal
    # 2. three in a row vertical
    # 3. three in a row diagonal
    # 4. no three in a row (draw/ tie)

# test to ensure game over

# test for game restart
