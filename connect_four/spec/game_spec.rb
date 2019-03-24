require 'game'

describe Game do
  before(:each) do
    @game = Game.new
  end

  context "Converts player input 'A-G' into a column position using " do
    describe '#determine_col' do
      it "input:'A' should return 0" do
        expect(@game.determine_col('A')).to eql(0)
      end

      it "input:'D' should return 3" do
        expect(@game.determine_col('D')).to eql(3)
      end

      it "input:'G' should return 6" do
        expect(@game.determine_col('G')).to eql(6)
      end

      it "input:'H' should return nil" do
        expect(@game.determine_col('H')).to be_nil
      end
    end
  end

  describe '#player_input' do
    it "Valid Case: should return user input 'A'"do
      expect(@game.player_input).to eql('A')
    end

    it "Invalid Case: shouldn't accept input 'Z'"do
    puts 'Enter B after attempting Z'
      expect(@game.player_input).to eql('B')
    end
  end
end
