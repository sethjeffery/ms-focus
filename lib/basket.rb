module Basket
  extend self

  def setup(products: [], delivery_charges: [], special_offers: [])
    Product.destroy_all
    DeliveryCharge.destroy_all
    SpecialOffer.destroy_all

    products.each do |product|
      Product.create! product
    end

    delivery_charges.each do |delivery_charge|
      DeliveryCharge.create! delivery_charge
    end

    special_offers.each do |special_offer|
      SpecialOffer.create! special_offer
    end
  end

  def add(product_code)
    product = Product.find_by(code: product_code)
    line_item = LineItem.find_or_initialize_by(product_id: product.id)
    line_item.quantity += 1 if line_item.persisted?
    line_item.save
  end

  def remove(product_code)
    product = Product.find_by(code: product_code)
    line_item = LineItem.find_by(product_id: product.id)
    if line_item
      line_item.update quantity: line_item.quantity - 1
    end
  end
end
