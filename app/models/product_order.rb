class ProductOrder < ApplicationRecord
  belongs_to :customer_order
  has_many :package_orders

  before_save :process_bundles

  validate :validate_quantity

  private

  def process_bundles
    self.cost_amount = 0.0
    self.package_orders.delete_all
    return unless quantity.present? && product_code.present?
    product = Product.where(code: product_code).first
    return unless product.present?
    total_quantity = quantity
    bundles = product.package_bundles.order(num_of_item: :desc)
    bundles.each do |p|
      break if total_quantity.zero?
      num = total_quantity / p.num_of_item
      mod = total_quantity % p.num_of_item
      if num > 0
        unless mod.zero?
          next if product.find_next_bundle(mod, p.id)
        end
        self.package_orders.build(quantity: num, package_bundle_id: p.id)
        total_quantity -= num * p.num_of_item
        self.cost_amount += num * p.cost_amount
      end
    end

  end

  def validate_quantity
    return unless quantity.present? && product_code.present? && !quantity.zero?
    product = Product.where(code: product_code).first
    return unless product.present?
    total_quantity = quantity
    bundles = product.package_bundles.order(num_of_item: :desc)
    bundles.each do |p|
      break if total_quantity.zero?
      num = total_quantity / p.num_of_item
      mod = total_quantity % p.num_of_item
      if num > 0
        unless mod.zero?
          next if product.find_next_bundle(mod, p.id)
        end
        total_quantity -= num * p.num_of_item
      end
    end
    return if total_quantity.zero?
    errors.add('quantity', 'No bundle available')
  end
end
