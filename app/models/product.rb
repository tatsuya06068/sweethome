class Product < ApplicationRecord
    has_one :product_detail
    has_many :materials_useds, through: :materials
end
