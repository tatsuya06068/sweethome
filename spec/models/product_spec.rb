require 'rails_helper'

RSpec.describe Product, type: :model do

    it "商品名、表示開始日、カテゴリーがある場合、有効である" do 
      product = FactoryBot.create(:product, displayto: nil)
      product.valid?
      expect(product).to be_valid
    end

    it "商品名がない場合、無効である" do
      product = FactoryBot.build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("を入力してください")
    end

    it "カテゴリーがない場合、無効である" do
      product = FactoryBot.build(:product, category_id: nil)
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "商品表示日がない場合、無効である" do
      product = FactoryBot.build(:product, displayfrom: nil)
      product.valid?
      expect(product.errors[:displayfrom]).to include("を入力してください")
    end
end
