require 'rails_helper'

RSpec.describe 'Basket' do
  before { load_seeds }

  context 'examples' do
    describe 'with S01, B01' do
      it 'costs £37.85' do
        Basket.add 'S01'
        Basket.add 'B01'
        expect(Basket.formatted_total).to eq '£37.85'
      end
    end

    context 'with J01, J01' do
      it 'costs £54.37' do
        Basket.add 'J01'
        Basket.add 'J01'
        expect(Basket.formatted_total).to eq '£54.37'
      end
    end

    context 'with J01, B01' do
      it 'costs £60.85' do
        Basket.add 'J01'
        Basket.add 'B01'
        expect(Basket.formatted_total).to eq '£60.85'
      end
    end

    context 'with S01, S01, J01, J01, J01' do
      it 'costs £98.27' do
        Basket.add 'S01'
        Basket.add 'S01'
        Basket.add 'J01'
        Basket.add 'J01'
        Basket.add 'J01'
        expect(Basket.formatted_total).to eq '£98.27'
      end
    end
  end
end
