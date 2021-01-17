class CreateMaterialsUseds < ActiveRecord::Migration[6.1]
  def change
    create_table :materials_useds do |t|
      t.integer :material_id

      t.timestamps
    end
  end
end
