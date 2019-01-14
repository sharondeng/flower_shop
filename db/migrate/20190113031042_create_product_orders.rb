class CreateProductOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :product_orders do |t|
      t.integer :customer_order_id
      t.string :product_code
      t.integer :quantity
      t.decimal :cost_amount

      t.timestamps
    end
  end
end
