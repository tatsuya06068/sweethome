# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Material.create!(name: "小麦粉")
MaterialsUsed.create!(material_id: 1)
10.times do |n|
    ProductDetail.create!(description: "ケーキの詳細情報#{n+1}")
    Product.create!(name: "ケーキ",displayfrome: '2021-01-01',product_detail_id: "#{n+1}", materials_used_id: 1)
end