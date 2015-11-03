require 'spec_helper'

describe 'String' do
  using Gemsupport::StringInteractions

  describe '#underscore' do
    context 'when snake_case word' do
      it 'does nothing' do
        expect('product'.underscore).to eq('product')
      end
    end

    context 'when Capitalized word' do
      it 'succeeds' do
        expect('Product'.underscore).to eq('product')
      end
    end

    context 'when CamelCase word that contains digits' do
      it 'succeeds' do
        expect('Product22Owner56'.underscore).to eq('product22_owner56')
      end
    end

    context 'when CamelCase word' do
      it 'succeeds' do
        expect('ProductOwner'.underscore).to eq('product_owner')
      end
    end

    context 'when namespaced CamelCase word' do
      it 'succeeds' do
        expect('Rails::ProductOwner'.underscore).to eq('rails/product_owner')
      end
    end
  end

  describe '#camelize' do
    context 'when CamelCase word' do
      it 'does nothing' do
        expect('ProductOwner'.camelize).to eq('ProductOwner')
      end
    end

    context 'when snake_case' do
      it 'succeeds' do
        expect('product_owner'.camelize).to eq('ProductOwner')
      end
    end

    context 'when snake_case word that contains digits' do
      it 'succeeds' do
        expect('product22_owner56'.camelize).to eq('Product22Owner56')
      end
    end

    context 'when namespaced snake_case word' do
      it 'succeeds' do
        expect('rails/kmlio/product_owner'.camelize).to eq('Rails::Kmlio::ProductOwner')
      end
    end
  end

  describe '#unindent' do
    context 'when empty string' do
      it 'does not remove anything' do
        expect(''.unindent).to eq('')
      end
    end

    context 'When simple line indentation' do
      it 'removes the spaces' do
        expect("\s\sabc".unindent).to eq('abc')
      end

      it 'removes the tabs' do
        expect("\tabc".unindent).to eq('abc')
      end

      it 'removes the whintespaces' do
        expect("\t\s\sabc".unindent).to eq('abc')
      end
    end

    context 'when multi-line identation' do
      it 'removes the whitespaces' do
        expect("\t\sabc\n\t\sabc".unindent).to eq("abc\nabc")
      end

      it 'keeps relative indentation' do
        expect("\tabc\n\t\tabc".unindent).to eq("abc\n\tabc")
      end

      it 'ignores blank lines for indent calculation' do
        expect("\n\tabc\n\n\t\tabc\n".unindent).to eq("\nabc\n\n\tabc\n")
      end
    end
  end

  describe '#unindent!' do
    let(:source) { "\s\sabc" }
    it 'modifies string in place' do
      expect { source.unindent! }.to change { source }.from("\s\sabc").to('abc')
    end
  end
end
