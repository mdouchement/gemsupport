require 'spec_helper'

describe Hash do
  let(:input_a) do
    { a: { b: { c: 3 } } }
  end

  let(:input_b) do
    { a: { b: { d: 4 } } }
  end

  let(:result_ab) do
    { a: { b: { c: 3, d: 4 } } }
  end

  describe '#deep_merge' do
    it 'merges all the values and returns new_hsh' do
      expect(input_a.deep_merge(input_b)).to eq(result_ab)
    end
  end

  describe '#deep_merge!' do
    it 'merges all the values and returns hsh' do
      input_a_cp = input_a.clone
      input_a_cp.deep_merge!(input_b)
      expect(input_a_cp).to eq(result_ab)
    end
  end
end
