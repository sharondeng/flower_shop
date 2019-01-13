class PackageBundle < ApplicationRecord
  belongs_to :product, inverse_of: :package_bundles
end
