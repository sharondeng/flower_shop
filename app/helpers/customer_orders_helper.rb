module CustomerOrdersHelper
  def bundle_size(product_code)
    Product.where(code: product_code)
           .first.package_bundles.pluck(:num_of_item).join(', ')
  end
end
