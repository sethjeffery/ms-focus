# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create! name: "Jeans", code: "J01", price: 3295
Product.create! name: "Blouse", code: "B01", price: 2495
Product.create! name: "Socks", code: "S01", price: 795

DeliveryCharge.create! price_threshold: 5000, charge: 495
DeliveryCharge.create! price_threshold: 9000, charge: 295

SpecialOffer.create! name: 'buy one pair, get another pair half price”', product: Product.find_by(code: 'J01'), quantity: 2, discount_percent: 50
