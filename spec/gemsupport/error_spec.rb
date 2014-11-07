require 'spec_helper'

module Gemsupport
  describe Error do
    let(:dummy_class) { Class.new.include(Error) }

    describe '.silent_exit' do
      it 'catch SystemExit error' do
        expect { dummy_class.silent_exit { exit(1) } }.to_not raise_error
      end
    end

    describe '.suppress' do
      it 'catch the given errors' do
        expect { dummy_class.suppress(RuntimeError, StandardError) { fail StandardError.new } }
          .to_not raise_error
      end

      it 'does not catch an error that not given' do
        expect { dummy_class.suppress(RuntimeError, StandardError) { fail ScriptError.new } }
          .to raise_error(ScriptError)
      end
    end
  end
end
