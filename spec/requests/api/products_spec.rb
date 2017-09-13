require 'rails_helper'

RSpec.describe 'Products API' do
  describe 'GET /api/products' do
    it 'returns all products' do
      create(:product, name: 'Alpha', code: 'A01', price: 120)
      create(:product, name: 'Beta', code: 'B01', price: 249)

      get '/api/products.json'
      json = JSON.parse(response.body)

      expect(response).to be_success

      expect(json[0]['name']).to eq 'Alpha'
      expect(json[1]['name']).to eq 'Beta'

      expect(json[0]['code']).to eq 'A01'
      expect(json[1]['code']).to eq 'B01'

      expect(json[0]['price']).to eq 120
      expect(json[1]['price']).to eq 249

      expect(json[0]['formatted_price']).to eq '£1.20'
      expect(json[1]['formatted_price']).to eq '£2.49'
    end
  end
end
