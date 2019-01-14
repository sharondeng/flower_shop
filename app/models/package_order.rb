class PackageOrder < ApplicationRecord
  belongs_to :product_order
  belongs_to :package_bundle
end
