class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_cents
      t.integer :stock_quantity
      t.string :sku

      t.timestamps
    end
  end
end
