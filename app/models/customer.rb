class Customer < ApplicationRecord
  belongs_to :customer_order, inverse_of: :customer
end
