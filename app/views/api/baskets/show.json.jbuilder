json.total            @basket.total
json.formatted_total  @basket.formatted_total
json.subtotal         @basket.subtotal
json.delivery_charge  @basket.delivery_charge

json.items do
  json.array! @basket.line_items, :name, :code, :price, :quantity, :total_cost, :formatted_total_cost
end
