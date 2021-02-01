class CreateProductDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :product_details do |t|
      t.string :description
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
