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

  context 'after_save' do
    context 'quantity is zero' do
      it 'destroys itself' do
        line_item = create(:line_item)
        expect {
          line_item.update(quantity: 0)
        }.to change{ LineItem.count }.by(-1)
      end
    end
  end
end
