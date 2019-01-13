class Product < ApplicationRecord
  has_many :package_bundles, inverse_of: :product
  has_many :product_orders
  has_many :customer_orders, through: :product_orders
end
