class MaterialsUsed < ApplicationRecord
  belongs_to :products, optional: true
  belongs_to :materials, optional: true
end
