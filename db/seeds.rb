# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do |n|
    Product.create!(name: "ケーキ",displayfrome: "2021-01-01")
    ProductDetail.create!(description: "ケーキの詳細情報#{n+1}",product_id: "#{n+1}")
    MaterialsUsed.create!(product_id: "#{n+1}",material_id: "#{n+1}")
    Material.create!(name: "小麦#{n+1}")
end
