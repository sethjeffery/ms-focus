class Product < ApplicationRecord
  include Formatted

  validates_presence_of :name, :price, :code
  has_many :line_items, dependent: :destroy
  has_many :special_offers, dependent: :destroy

  def formatted_price
    format price
  end
end
