class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name ,null: false
      t.date :displayfrome ,null: false
      t.date :displayto
      t.timestamps
    end
  end
end
