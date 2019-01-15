class CustomerOrder < ApplicationRecord
  has_many :product_orders, inverse_of: :customer_order
  has_one :customer, inverse_of: :customer_order

  accepts_nested_attributes_for :product_orders, allow_destroy: true
  accepts_nested_attributes_for :customer, allow_destroy: true

  after_save :sum_total

  private

  def sum_total
    total_amount = product_orders.map(&:cost_amount).sum.to_f
    update_column(:total_cost_amount, total_amount)
  end
end
