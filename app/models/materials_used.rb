class MaterialsUsed < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :material, optional: true
  validates_presence_of :material_id 
end
