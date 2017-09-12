require 'rails_helper'

RSpec.describe SpecialOffer, type: :model do
  describe '#code=' do
    let(:product) { create(:product) }

    it 'updates the product reference' do
      subject.code = product.code
      expect(subject.product).to eq product
    end
  end

  describe '#valid_for?' do
    subject { build_stubbed(:special_offer, quantity: 2) }
    let(:line_item) { build_stubbed(:line_item, product: subject.product, quantity: 3) }

    context 'with sufficient quantity and correct product' do
      it 'is valid' do
        expect(subject).to be_valid_for line_item
      end
    end

    context 'with insufficient quantity' do
      let(:line_item) { build_stubbed(:line_item, product: subject.product, quantity: 1) }

      it 'is invalid' do
        expect(subject).not_to be_valid_for line_item
      end
    end

    context 'with wrong product' do
      let(:line_item) { build_stubbed(:line_item, quantity: 3) }

      it 'is invalid' do
        expect(subject).not_to be_valid_for line_item
      end
    end
 end

  describe '#discount_for' do
    let(:product) { build_stubbed(:product, price: 100) }
    let(:line_item) { build_stubbed(:line_item, product: product) }
    subject { build_stubbed(:special_offer, discount_percent: 50, product: product) }

    context 'when the discount is valid' do
      before do
        expect(subject).to receive(:valid_for?).with(line_item).and_return true
      end

      it 'is the discounted price' do
        expect(subject.discount_for line_item).to eq line_item.price * 0.5
      end
    end

    context 'when the discount is not valid' do
      before do
        expect(subject).to receive(:valid_for?).with(line_item).and_return false
      end

      it 'is zero' do
        expect(subject.discount_for line_item).to eq 0
      end
    end
  end
end
