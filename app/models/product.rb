class Product < ApplicationRecord
  has_one :product_detail
  has_many :materials_useds
  has_many :materials, through: :materials_useds
end
