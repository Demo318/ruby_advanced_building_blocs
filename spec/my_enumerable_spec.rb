require_relative '../my_enumerable.rb'

describe Enumerable do
  describe '#my_each' do
    context 'when passed an array' do
      it 'returns original array' do
        expect([1, 2, 3, 4].my_each { |num| num + 1 }).to eql([1, 2, 3, 4])
      end
    end
  end

  describe '#my_all?' do
    context 'when passed block with where all true' do
      it 'returns true' do
        expect([1, 2, 3, 4].my_all? { |num| num < 5}).to eql(true)
      end
    end

    context 'when passed block with where all false' do
      it 'returns false' do
        expect([1, 2, 3, 4].my_all? { |num| num > 5}).to eql(false)
      end
    end

    context 'when passed block with where one false' do
      it 'returns false' do
        expect([1, 2, 3, 4].my_all? { |num| num < 4}).to eql(false)
      end
    end
  end

  describe '#my_none?' do
    context 'when passed block where all are false' do
      it 'returns true' do
        expect([1, 2, 3, 4].my_none? { |num| num > 5 }).to eql(true)
      end
    end

    context 'when passed block where all are true' do
      it 'returns false' do
        expect([1, 2, 3, 4].my_none? { |num| num < 5 }).to eql(false)
      end
    end

    context 'when passed block where all one is true' do
      it 'returns false' do
        expect([1, 2, 3, 4].my_none? { |num| num < 4 }).to eql(false)
      end
    end
  end

  describe '#my_map' do
    context 'when passed an array & block' do
      it 'returns array with updated values' do
        expect([1, 2, 3, 4].my_map { |num| num + 1 }).to eql([2, 3, 4, 5])
      end
    end
  end

  describe '#my_select' do
    context 'when passed an array & block' do
      it 'returns array with values returning "true" in block' do
        expect([1, 2, 3, 4].my_select { |num| num < 3 }).to eql([1, 2])
      end
    end
  end

  describe '#my_inject' do
    context 'when passed no arguments' do
      it 'returns sum total of values in array' do
        expect([1, 2, 3, 4].my_inject).to eql(10)
      end
    end

    context 'when passed an integer' do
      it 'returns sum total of values in array, plus passed int' do
        expect([1, 2, 3, 4].my_inject(2)).to eql(12)
      end
    end

    context 'when passed an integer and * as symb' do
      it 'returns sum total of values in array, plus passed int' do
        expect([1, 2, 3, 4].my_inject(2, :*)).to eql(48)
      end
    end
  end
end
