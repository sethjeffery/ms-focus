class SpecialOffer < ApplicationRecord
  belongs_to :product

  delegate :code, to: :product

  def code=(code)
    self.product = Product.find_by(code: code)
  end
end
