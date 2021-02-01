class CreateMaterialsUseds < ActiveRecord::Migration[6.1]
  def change
    create_table :materials_useds do |t|
      t.timestamps
      t.references :product, foreign_key: true
      t.references :material, foreign_key: true
    end
    
  end
end
