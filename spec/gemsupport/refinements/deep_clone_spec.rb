require 'spec_helper'

describe Object do
  using Gemsupport::DeepClone

  describe '#deep_clone' do
    context 'when deep clone action is impossible' do
      it 'raises an error' do
        expect { 5.deep_clone }.to raise_error(TypeError, "can't clone Fixnum")
      end
    end

    context 'modifications on deep cloned object' do
      context 'when it is basic objects like hash or array' do
        let(:input) do
          {
            key: 'trololo',
            ary: [
              { k1: 12, k2: '23' },
              { k1: 45, k2: '56' }
            ]
          }
        end
        let!(:deep_cloned) { input.deep_clone }

        before do
          deep_cloned[:another_key] = 'yolo'
          deep_cloned[:ary].last[:k2] = 65
          deep_cloned[:ary] << 'inserted value'
        end

        it 'does not change the original' do
          expect(deep_cloned).to_not eq(input)
        end

        it 'changes the cloned object' do
          expect(deep_cloned).to eq(key: 'trololo',
                                    another_key: 'yolo',
                                    ary: [{ k1: 12, k2: '23' },
                                          { k1: 45, k2: 65 },
                                          'inserted value'])
        end
      end

      context 'when it is a custom object' do
        let(:dummy_class) do
          Object.new.tap do |instance|
            class << instance
              attr_accessor :var1, :var2

              def concat_vars
                "#{@var1} - #{@var2}"
              end
            end
          end
        end
        let(:input) do
          dummy_class.tap do |dc|
            dc.var1 = %w(ab cd)
            dc.var2 = { k1: 'trololo', k2: 'yolo' }
          end
        end
        let!(:deep_cloned) { input.deep_clone }
        let(:modify_clone) do
          lambda do
            deep_cloned.var1 << 'inserted value'
            deep_cloned.var2 = 'yolo'
          end
        end

        it 'does not change the original' do
          expect { modify_clone.call }.to_not change { input }
        end

        it 'changes the cloned object' do
          expect { modify_clone.call }.to change(deep_cloned, :concat_vars)
          .from(input.concat_vars).to('["ab", "cd", "inserted value"] - yolo')
        end
      end
    end
  end
end
