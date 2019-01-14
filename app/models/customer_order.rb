class CustomerOrder < ApplicationRecord
  has_many :product_orders
  has_one :customer, inverse_of: :customer_order

  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :customer, allow_destroy: true
end
