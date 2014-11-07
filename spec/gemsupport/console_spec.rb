require 'spec_helper'

module Gemsupport
  describe Console do
    let(:dummy_class) { Class.new.include(Console) }

    describe '.capture_console' do
      # rubocop:disable Output
      it 'captures the console' do
        expect(dummy_class.capture_console { puts 'Trololo' }).to eq("Trololo\n")
      end
      # rubocop:enable Output
    end
  end
end
