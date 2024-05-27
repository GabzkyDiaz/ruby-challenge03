require_relative 'ar.rb'

# Create a set to keep track of unique category names
created_categories = Set.new

10.times do
  begin
    category_name = Faker::Commerce.department
  end while created_categories.include?(category_name) || Category.exists?(name: category_name)

  category = Category.create(name: category_name)
  created_categories.add(category_name)

  10.times do
    category.products.create(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: Faker::Commerce.price,
      stock_quantity: rand(1..100)
    )
  end
end
