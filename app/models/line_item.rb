class LineItem < ApplicationRecord
  include Formatted

  belongs_to :product

  delegate :code, :name, :price, to: :product

  validates_presence_of :product
  after_save :check_quantity_zero

  def total_cost
    price * quantity
  end

  def formatted_total_cost
    format total_cost
  end

  private

  def check_quantity_zero
    destroy if quantity.zero?
  end
end
