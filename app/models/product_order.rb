class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :customer_order
end
