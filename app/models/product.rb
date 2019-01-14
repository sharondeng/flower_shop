class Product < ApplicationRecord
  has_many :package_bundles, inverse_of: :product

  def find_next_bundle(remain_item, package_bundle_id)
    skip = true
    package_bundles.each do |b|
      next if b.id == package_bundle_id
      mod = remain_item % b.num_of_item
      if mod.zero?
        skip = false
        break
      end
    end
    skip
  end
end
