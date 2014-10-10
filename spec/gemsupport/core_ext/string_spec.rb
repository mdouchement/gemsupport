require 'spec_helper'

describe 'String' do
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
end
