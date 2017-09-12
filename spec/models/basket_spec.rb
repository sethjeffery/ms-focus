require 'rails_helper'

RSpec.describe Basket do
  describe '#initialize' do
    it 'receives product catalog, delivery charge rules, and offers'
  end

  describe '#add' do
    it 'takes the product code as a parameter'
  end

  describe '#total' do
    it 'returns the total cost of the basket'
    it 'takes into account the delivery and offer rules'
  end
end
