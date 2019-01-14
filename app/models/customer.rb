class Customer < ApplicationRecord
  belongs_to :customer_order, inverse_of: :customer

  validates_presence_of :name, :address

end
