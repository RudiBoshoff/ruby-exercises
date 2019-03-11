require './tic_tac_toe'

describe 'TicTacToe' do
  before(:each) do
    @game = TicTacToe.new
  end

  describe '#generate_board' do
    context 'test to see if board generated correctly' do
      it 'returns a 3 by 3 grid' do
        expect(@game.generate_board).to match_array([1, 2, 3, 4, 5, 6, 7, 8, 9])
      end
    end
  end

  describe '#determine_turn' do
    context 'test to see if turns alternate' do
      it "returns X's turn" do
        expect(@game.determine_turn(true)).to eql("It is X's turn")
      end

      it "returns O's turn" do
        expect(@game.determine_turn(false)).to eql("It is O's turn")
      end
    end
  end

  describe '#move_valid?' do
    before(:each) do
      @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    it 'should return true' do
      expect(@game.move_valid?(2, @board)).to be true
    end

    it 'should return false' do
      expect(@game.move_valid?(10, @board)).to be false
    end
  end
end
