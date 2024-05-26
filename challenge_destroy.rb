load 'ar.rb'

product_to_delete = Product.find_by(name: "Product 1")
product_to_delete.destroy if product_to_delete
