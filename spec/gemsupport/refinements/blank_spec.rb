require 'spec_helper'

class EmptyTrue
  def empty?
    0
  end
end

class EmptyFalse
  def empty?
    nil
  end
end

describe 'blank' do
  using Gemsupport::Blank

  context 'when it is a blank object' do
    [EmptyTrue.new, nil, false, '', ' ', " \n\t \r ", '　', "\u00a0", [], {}].each do |blank_value|
      describe "#{blank_value.class}#blank?" do
        it 'returns true' do
          expect(blank_value.blank?).to be(true)
        end
      end

      describe "#{blank_value.class}#present?" do
        it 'returns false' do
          expect(blank_value.present?).to be(false)
        end
      end

      describe "#{blank_value.class}#presence" do
        it 'returns nil' do
          expect(blank_value.presence).to be(nil)
        end
      end
    end
  end

  context 'when it is not a blank object' do
    [EmptyFalse.new, Object.new, true, 0, 1, 'a', [nil], { nil => 0 }].each do |not_blank_value|
      describe "#{not_blank_value.class}#blank?" do
        it 'returns false' do
          expect(not_blank_value.blank?).to be(false)
        end
      end

      describe "#{not_blank_value.class}#present?" do
        it 'returns true' do
          expect(not_blank_value.present?).to be(true)
        end
      end

      describe "#{not_blank_value.class}#presence" do
        it 'returns the value' do
          expect(not_blank_value.presence).to be(not_blank_value)
        end
      end
    end
  end
end
