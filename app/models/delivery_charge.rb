class DeliveryCharge < ApplicationRecord
  def self.price_for_total(total)
    where("price_threshold > ?", total).first&.charge.to_i
  end
end
