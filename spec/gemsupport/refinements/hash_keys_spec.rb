require 'spec_helper'

describe Hash do
  using Gemsupport::HashKeys

  let(:simple) do
    {
      strings: { 'a' => 1, 'b' => 2 },
      upcase_strings: { 'A' => 1, 'B' => 2 },
      symbols: { a: 1, b: 2 },
      mixed: { 'a' => 1, b: 2 },
      fixnums: { 0 => 1, 1 => 2 }
    }
  end

  let(:nested) do
    {
      strings: { 'a' => { 'b' => { 'c' => 3 } } },
      upcase_strings: { 'A' => { 'B' => { 'C' => 3 } } },
      symbols: { a: { b: { c: 3 } } },
      mixed: { 'a' => { b: { 'c' => 3 } } },
      fixnums: { 0 => { 1 => { 'c' => 3 } } }
    }
  end

  describe '#transform_keys' do
    # to long to write and already tested from activesupport
  end
end
