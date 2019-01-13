class CreatePackageBundles < ActiveRecord::Migration[5.1]
  def change
    create_table :package_bundles do |t|
      t.integer :product_id
      t.integer :num_of_item
      t.decimal :cost_amount

      t.timestamps
    end
    add_index :package_bundles, :product_id
  end
end
