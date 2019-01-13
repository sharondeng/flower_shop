class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.integer :product_id
      t.integer :customer_order_id

      t.timestamps
    end
  end
end
