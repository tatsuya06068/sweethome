require 'rails_helper'

RSpec.describe Product, type: :model do

    it "商品名、表示開始日、カテゴリーがある場合、有効である" do 
      category = FactoryBot.create(:category)
      product = category.build(:product)
      product.valid?
      expect(product).to be_valid
    end

    it "商品名がない場合、無効である"
    it "カテゴリーがない場合、無効である"
end
