require './enumerable.rb'

describe Enumerable do
  let(:test_array) { [1, 2, 3] }
  describe '#my_each' do
    context 'when passed an array' do
      it 'returns original array' do
        expect(test_array.my_each).to eql(test_array)
      end
    end
  end

  describe '#my_all?' do
    context 'when passed block with condition met' do
      it 'returns true' do
        expect(test_array.my_all? { |num| num < 5 }).to eql(true)
      end
    end
  end

  describe '#my_map'do
    context 'when passed with block' do
      it 'returns array with each element squared' do
        expect(test_array.my_map {|num| num**2}).to eql([1,4,9])
      end
    end

    context 'when passed without a block' do
      it 'returns Enumerator #my_map' do
        expect(test_array.my_map).to eql("#<Enumerator: #{[1,2,3]}:my_map>")
      end
    end
  end

end
