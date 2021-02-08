class Product < ApplicationRecord
  has_one :product_detail
  belongs_to :category
  has_many :materials_useds
  has_many :materials, through: :materials_useds

  validates :name, presence: true
  validates :displayfrom, presence: true
  validates :category_id, presence: true
end
