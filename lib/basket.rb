class Basket
  include Formatted

  class << self
    # Set up the shop catalog with the given products, delivery charges and offers
    def setup(products: [], delivery_charges: [], special_offers: [])
      Product.destroy_all
      DeliveryCharge.destroy_all
      SpecialOffer.destroy_all

      products.each do |product|
        Product.create! product
      end

      delivery_charges.each do |delivery_charge|
        DeliveryCharge.create! delivery_charge
      end

      special_offers.each do |special_offer|
        SpecialOffer.create! special_offer
      end
    end

    def add(product_code)
      new.add(product_code)
    end

    def remove(product_code)
      new.remove(product_code)
    end

    def empty
      new.empty
    end
  end

  # Add a new line item by its product code
  def add(product_code)
    product = Product.find_by!(code: product_code)
    line_item = LineItem.find_or_initialize_by(product_id: product.id)
    line_item.quantity += 1 if line_item.persisted?
    line_item.save
    clear_cache
  end

  # Remove a line item (or reduce quantity) by its product code
  def remove(product_code)
    product = Product.find_by!(code: product_code)
    line_item = LineItem.find_by(product_id: product.id)
    if line_item
      line_item.update quantity: line_item.quantity - 1
    end
    clear_cache
  end

  def empty
    LineItem.destroy_all
    clear_cache
  end

  # The price of all line items, not including discounts or delivery charges
  def subtotal
    return @subtotal if @subtotal

    # Get all relevant special offers
    special_offers = SpecialOffer.where(product_id: line_items.map(&:product_id))

    @subtotal = line_items.reduce(0){ |total, line_item|
      # Pick all offers for the given line item, and apply their discount
      # TODO: What if multiple offers exist for the same product?

      offers = special_offers.select{|offer| offer.product_id == line_item.product_id}
      total + line_item.total_cost - offers.map{|offer| offer.discount_for(line_item) }.sum
    }
  end

  def delivery_charge
    @delivery_charge ||= DeliveryCharge.price_for_total(subtotal)
  end

  def total
    @total ||= subtotal + delivery_charge
  end

  def formatted_total
    format total
  end

  def line_items
    @line_items ||= LineItem.all
  end

  private

  def clear_cache
    @subtotal = nil
    @delivery_charge = nil
    @total = nil
    @line_items = nil
  end
end
