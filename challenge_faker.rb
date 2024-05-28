require_relative 'ar.rb'

# Use Faker's unique method to generate unique category names
10.times do
  begin
    category_name = Faker::Commerce.unique.department
  end while Category.exists?(name: category_name)

  category = Category.create(name: category_name)

  # Use Faker's unique method to generate unique product names
  10.times do
    begin
      product_name = Faker::Commerce.unique.product_name
    end while Product.exists?(name: product_name)

    category.products.create(
      name: product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: rand(1..100)
    )
  end
end

# Clear unique generator after usage to prevent memory bloat
Faker::UniqueGenerator.clear
