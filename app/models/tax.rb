class Tax < ApplicationRecord
  has_many :products

  validates :tax, presence: true

end
