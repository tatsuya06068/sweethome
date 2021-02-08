class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name ,null: false
      t.date :displayfrom ,null: false
      t.date :displayto
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
