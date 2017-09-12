class CreateSpecialOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :special_offers do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.integer :quantity
      t.float :discount_percent

      t.timestamps
    end
  end
end
