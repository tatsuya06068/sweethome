class AddProducToMoneyAndTaxreference < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :money, :integer
    add_reference :products, :tax, null: false, foreign_key: true
  end
end
