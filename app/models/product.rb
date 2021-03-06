class Product < ApplicationRecord
  has_one :product_detail,dependent: :destroy
  belongs_to :category
  belongs_to :tax
  has_many :materials_useds,dependent: :destroy
  has_many :materials, through: :materials_useds
  has_one_attached :image

  accepts_nested_attributes_for :product_detail, :materials_useds, allow_destroy: true

  validates :name, presence: true
  validates :displayfrom, presence: true
  validates :category_id, presence: true
end
