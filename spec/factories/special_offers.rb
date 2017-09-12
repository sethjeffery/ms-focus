FactoryGirl.define do
  factory :special_offer do
    name "Special Offer"
    product
    quantity 2
    discount_percent 50
  end
end
