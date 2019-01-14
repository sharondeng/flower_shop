class CreateCustomerOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_orders do |t|
      t.decimal :total_cost_amount

      t.timestamps
    end
  end
end
