class CreateOrderItems < ActiveRecord::Migration[7.1]
  def change
    create_table :order_items do |t|
      t.string :order_id
      t.string :product_id
      t.string :quantity
      t.string :price_cents

      t.timestamps
    end
  end
end
