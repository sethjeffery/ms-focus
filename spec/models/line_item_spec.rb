require 'rails_helper'

RSpec.describe LineItem, type: :model do
  describe '#total_cost' do
    let(:product) { build(:product, price: 200) }

    it 'is the total cost of the line item (quantity x price)' do
      subject.product = product
      subject.quantity = 5
      expect(subject.total_cost).to eq(5 * 200)
    end
  end
end
