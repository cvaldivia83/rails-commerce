class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :customer_email
      t.string :customer_name
      t.integer :status, default: 0, null: false
      t.integer :total_cents
      t.string :source_email_id

      t.timestamps
    end
  end
end
