class CreateDeliveryCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :delivery_charges do |t|
      t.integer :price_threshold
      t.integer :charge, null: false, default: 0

      t.timestamps
    end
  end
end
