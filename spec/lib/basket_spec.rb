require 'rails_helper'
require 'basket'

RSpec.describe Basket do
  describe '#setup' do
    it 'receives product catalog, delivery charge rules, and offers' do
      Basket.setup products: [{ name: 'Thing', code: 'AB01', price: 100 }],
                   delivery_charges: [{ price_threshold: 5000, charge: 195 }],
                   special_offers: [{ name: 'BOGOF', quantity: 2, discount_percent: 100, code: 'AB01' }]

      expect(Product.count).to eq 1
      expect(DeliveryCharge.count).to eq 1
      expect(SpecialOffer.count).to eq 1
    end

    it 'clears any existing data' do
      create(:product, name: 'Old', code: 'AB01', price: 100)
      Basket.setup products: [{ name: 'New', code: 'CD01', price: 100 }]
      expect(Product.pluck(:name)).to eq(['New'])
    end
  end

  describe '#add' do
    let(:product) { create(:product) }

    it 'takes the product code as a parameter' do
      expect{ Basket.add(product.code) }.not_to raise_error
    end

    it 'adds a line item' do
      Basket.add(product.code)
      expect(LineItem.first.product).to eq product
      expect(LineItem.first.quantity).to eq 1
    end

    it 'increases quantity' do
      3.times { Basket.add(product.code) }
      expect(LineItem.first.quantity).to eq 3
    end
  end

  describe '#remove' do
    let(:product) { create(:product) }

    it 'takes the product code as a parameter' do
      expect{ Basket.remove(product.code) }.not_to raise_error
    end

    context 'with no line items' do
      it 'does nothing' do
        expect{ Basket.remove(product.code) }.not_to change{ LineItem.count }
      end
    end

    context 'with one line item' do
      it 'removes the line item' do
        LineItem.create! product: product
        expect{ Basket.remove(product.code) }.to change{ LineItem.count }.by(-1)
      end
    end

    context 'with a line item of > 1 quantity' do
      it 'reduces the item quantity' do
        item = LineItem.create! product: product, quantity: 2
        expect{ Basket.remove(product.code) }.to change{ item.reload.quantity }.from(2).to(1)
      end
    end
  end

  describe '#total' do
    it 'returns the total cost of the basket'
    it 'takes into account the delivery and offer rules'
  end
end