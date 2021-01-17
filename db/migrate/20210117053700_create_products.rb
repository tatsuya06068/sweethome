class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name ,null: false
      t.date :displayfrome ,null: false
      t.date :displayto
      t.integer :product_detail_id
      t.integer :materials_used_id
      t.timestamps
    end
  end
end
