require 'rails_helper'

RSpec.describe 'Basket' do
  before { load_seeds }

  context 'examples' do
    describe 'with S01, B01' do
      it 'costs £37.85'
    end

    context 'with J01, J01' do
      it 'costs £54.37'
    end

    context 'with J01, B01' do
      it 'costs £60.85'
    end

    context 'with S01, S01, J01, J01, J01' do
      it 'costs £98.27'
    end
  end
end
