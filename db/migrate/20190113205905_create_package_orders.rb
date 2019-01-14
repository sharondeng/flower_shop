class CreatePackageOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :package_orders do |t|
      t.integer :product_order_id
      t.integer :package_bundle_id
      t.integer :quantity

      t.timestamps
    end
  end
end
