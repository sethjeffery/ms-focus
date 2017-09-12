FactoryGirl.define do
  factory :product do
    sequence(:name) { |i| "Product-#{i}" }
    sequence(:code) { |i| "P#{i.to_s.rjust(2, "0")}" }
    price 100
  end
end
