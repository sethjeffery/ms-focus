require 'rails_helper'

RSpec.describe DeliveryCharge, type: :model do
  describe '.price_for_total' do
    it 'returns the delivery charge price for the given total' do
      create(:delivery_charge, price_threshold: 100, charge: 149)
      create(:delivery_charge, price_threshold: 200, charge: 249)

      # below threshold
      expect(described_class.price_for_total(99)).to eq 149

      # above threshold
      expect(described_class.price_for_total(100)).to eq 249
    end

    context 'with no charges above the total' do
      it 'is free' do
        create(:delivery_charge, price_threshold: 100, charge: 100)
        expect(described_class.price_for_total(200)).to eq 0
      end
    end
  end
end
