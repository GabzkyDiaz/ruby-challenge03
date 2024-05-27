load 'ar.rb'

product_to_delete = Product.find_by(name: "Product 1")
product_to_delete.destroy if product_to_delete

# Verify that the product no longer exists in the database
product_check = Product.find_by(name: "Product 1")
puts "Product still exists in database: #{!product_check.nil?}"

# Inspect the in-memory object
puts product_to_delete.inspect
