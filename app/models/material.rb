class Material < ApplicationRecord
  has_many :materials_useds
  has_many :products, through: :materials_useds

  validates :name, presence: true
end
