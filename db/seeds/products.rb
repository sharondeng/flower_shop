module ProductSeed
  def self.create_products(products)
    count = 0
    products.each do |prod|
      product = Product.where(name: prod[:name], code: prod[:code]).first_or_create! do |p|
        prod[:bundle].each do |bundle|
          p.package_bundles.build(num_of_item: bundle[:item],
                                  cost_amount: bundle[:cost])
        end
        count += 1
        puts "       Create product name: #{p.name}"
      end
    end
    puts "       Created #{count} products"
  end

  def self.load_products
    products = [
      { name: 'Roses', code: 'R12',
        bundle: [{ item: 5, cost: 6.99 },
                 { item: 10, cost: 12.99 }] },
      { name: 'Lilies', code: 'L09',
        bundle: [{ item: 3, cost: 9.95 },
                 { item: 6, cost: 16.95 },
                 { item: 9, cost: 24.95 }] },
      { name: 'Tulips', code: 'T58',
        bundle: [{ item: 3, cost: 5.95 },
                 { item: 5, cost: 9.95 },
                 { item: 9, cost: 16.99 }] }
    ]
    create_products(products)
  end

  puts '-----> Loading Products'
  load_products
end
