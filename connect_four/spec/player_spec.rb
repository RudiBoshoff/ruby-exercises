require 'player'

describe Player do
  before(:each) do
    @player1 = Player.new("\u26AA") # white
    @player2 = Player.new("\u26AB") # black
  end

  describe '#new' do
    it 'should return an instance of the class Player' do
      expect(@player1).to be_an_instance_of(Player)
    end

    context 'each player is assigned an identifier' do
      it 'returns player1 identifier when called' do
        expect(@player1.piece).to eql("\u26AA")
      end

      it 'returns player2 identifier when called' do
        expect(@player2.piece).to eql("\u26AB")
      end
    end
  end
end
