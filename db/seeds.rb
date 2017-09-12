# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Basket.setup(products: [
  { name: "Jeans", code: "J01", price: 3295 },
  { name: "Blouse", code: "B01", price: 2495 },
  { name: "Socks", code: "S01", price: 795 }
], delivery_charges: [
  { price_threshold: 5000, charge: 495 },
  { price_threshold: 9000, charge: 295 }
], special_offers: [
  { name: 'buy one pair, get another pair half price”', code: 'J01', quantity: 2, discount_percent: 50 }
])
