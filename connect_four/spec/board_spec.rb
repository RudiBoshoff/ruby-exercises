require 'board'

describe Board do
  context 'The board class should generate the grid that accomodates player pieces' do
    before(:each) do
      @grid = Board.new
      @blank = "\u26F6 "
    end

    describe '#new' do
      it 'should return an instance of the class Board' do
        expect(@grid).to be_an_instance_of(Board)
      end
    end

    describe "grid" do
      it 'should be a 6 by 7 Array' do
        expect(@grid.grid.size).to eql(6)
        expect(@grid.grid[0].size).to eql(7)
        expect(@grid.grid).to be_an_instance_of(Array)
      end

      it 'should contain place holders for the board pieces' do
        expect(@grid.grid.first.first).to eql(@blank)
        expect(@grid.grid.first).to eql(Array.new 7, @blank)
      end
    end
  end
end
