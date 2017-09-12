class SpecialOffer < ApplicationRecord
  belongs_to :product

  delegate :code, to: :product

  validates_presence_of :name

  def code=(code)
    self.product = Product.find_by(code: code)
  end

  def discount_for(line_item)
    if valid_for?(line_item)
      ((discount_percent * line_item.price) / 100.0).ceil.to_i
    else
      0
    end
  end

  def valid_for?(line_item)
    return false if product_id != line_item.product_id
    return false if quantity > line_item.quantity
    true
  end
end
