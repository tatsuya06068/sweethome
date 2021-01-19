class CreateProductDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :product_details do |t|
      t.string :description
      t.timestamps
    end
    add_foreign_key :product
  end
end
