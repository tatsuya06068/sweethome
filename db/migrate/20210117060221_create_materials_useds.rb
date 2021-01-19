class CreateMaterialsUseds < ActiveRecord::Migration[6.1]
  def change
    create_table :materials_useds do |t|
      t.timestamps
    end
    add_foreign_key :product, :material
  end
end
