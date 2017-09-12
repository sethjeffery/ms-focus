class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :code, null: false

      t.timestamps
    end

    add_index :products, :code
  end
end
