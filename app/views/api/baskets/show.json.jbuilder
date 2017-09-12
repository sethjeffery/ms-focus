json.total                      Basket.total
json.formatted_total            Basket.formatted_total
json.subtotal                   Basket.subtotal
json.delivery_charge            Basket.delivery_charge

json.items do
  json.array! Basket.line_items, :name, :code, :price, :quantity, :total_cost
end
