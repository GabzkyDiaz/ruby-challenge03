load 'ar.rb'

# Method 1
product1 = Product.create(name: "Product 1", description: "Description 1", price: 15.0, stock_quantity: 10)

# Method 2
product2 = Product.new
product2.name = "Product 2"
product2.description = "Description 2"
product2.price = 20.0
product2.stock_quantity = 5
product2.save

# Method 3
product3 = Product.new do |p|
  p.name = "Product 3"
  p.description = "Description 3"
  p.price = 25.0
  p.stock_quantity = 8
end
product3.save

# Create a Product with Missing Required Columns
product_invalid = Product.new(name: "P", description: "Desc", price: nil)
unless product_invalid.save
  puts "Errors: #{product_invalid.errors.full_messages.join(", ")}"
end
