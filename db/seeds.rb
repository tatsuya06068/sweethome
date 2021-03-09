# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
  #Admin.create!(email: "aaa@aaa.com", password: "111111")
#5.times do |n|
  #Category.create!(name: "ケーキ#{n+1}")
  #Material.create!(name: "チョコ#{n+1}")
  #Product.create!(name: "チョコ#{n+1}", displayfrom: "2021-01-01", displayto: "2021-12-#{n + 1}", category_id: (n + 1).to_s)
  #ProductDetail.create!(description: "チョコの詳細#{n + 1}", product_id: (1 + n).to_s)
  #MaterialsUsed.create!(product_id: (1 + n).to_s, material_id: (n + 1).to_s)
#end
  Tax.create!(tax: "10")
  Tax.create!(tax: "8")
