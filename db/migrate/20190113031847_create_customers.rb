class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.integer :customer_order_id
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
