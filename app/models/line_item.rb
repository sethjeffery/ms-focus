class LineItem < ApplicationRecord
  belongs_to :product

  delegate :code, :name, :price, to: :product

  validates_presence_of :product
  after_save :check_quantity_zero

  def total_cost
    price * quantity
  end

  private

  def check_quantity_zero
    destroy if quantity.zero?
  end
end
