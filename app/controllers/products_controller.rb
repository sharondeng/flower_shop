class ProductsController < ApplicationController
  def index
    all_products = Product.all
    @products = grid_array(all_products)
  end

  private

  def grid_array(products)
    return nil unless products.present?
    grid_size = products.length / Constant::COLUMNS_PER_ROW + products.length % Constant::COLUMNS_PER_ROW
    grid = []
    index = 0
    loop do
      sub_array = products.to_a.slice(index, Constant::COLUMNS_PER_ROW)
      break if sub_array.blank?
      grid.push(sub_array)
      index += Constant::COLUMNS_PER_ROW
    end
    grid
  end
end
