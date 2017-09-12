require 'rails_helper'

RSpec.describe 'Basket API' do
  let(:product) { create(:product, price: 1999) }

  describe 'GET /api/basket' do
    it 'returns information about the basket' do
      Basket.add(product.code)

      get '/api/basket.json'
      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['subtotal']).to eq(1999)
      expect(json['total']).to eq(1999)
      expect(json['formatted_total']).to eq('£19.99')
      expect(json['items']).to eq([{ 'name' => product.name,
                                     'code' => product.code,
                                     'price' => product.price,
                                     'quantity' => 1,
                                     'total_cost' => product.price }])
    end
  end

  describe 'POST /api/basket/add' do
    it 'adds a new item to the basket' do
      post '/api/basket/add.json', params: { code: product.code }
      post '/api/basket/add.json', params: { code: product.code }

      expect(response).to be_success
      expect(LineItem.first.product).to eq product
      expect(LineItem.first.quantity).to eq 2
    end
  end

  describe 'POST /api/basket/remove' do
    it 'adds a new item to the basket' do
      Basket.add(product.code)

      post '/api/basket/remove.json', params: { code: product.code }

      expect(response).to be_success
      expect(LineItem.count).to eq 0
    end
  end
end
