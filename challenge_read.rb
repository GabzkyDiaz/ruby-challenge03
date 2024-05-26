require_relative 'ar.rb'

# Total number of products
number_of_products = Product.count

puts "There are #{number_of_products} in the products table."

# Products above $10 with names beginning with 'C'
products_above_10 = Product.where('price > ? AND name LIKE ?', 10, 'C%')
puts "Products above $10 with names starting with 'C':"
products_above_10.each { |p| puts p.name }

# Products with low stock
low_stock_products = Product.where('stock_quantity < ?', 5)
puts "Low stock products count: #{low_stock_products.count}"

# Find the name of the category associated with one of the products
product = Product.first
puts "The category for the product '#{product.name}' is '#{product.category.name}'."

# Create and persist a new product associated with a specific category without manually setting the foreign key
category = Category.find_by(name: 'Beverages')
new_product = category.products.build(name: 'New Product', description: 'New Product Description', price: 20.0, stock_quantity: 15)
new_product.save

puts "New product created: #{new_product.inspect}"

# Find all products of a specific category over a certain price
specific_category = Category.find_by(name: 'Beverages')
expensive_products = specific_category.products.where('price > ?', 15)
puts "Products in the 'Beverages' category priced over $15:"
expensive_products.each { |product| puts product.name }
