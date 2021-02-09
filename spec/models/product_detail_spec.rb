require 'rails_helper'

RSpec.describe ProductDetail, type: :model do
  it "詳細、商品IDがある場合、有効である" do
    productDetail =FactoryBot.create(:product_detail)
    productDetail.valid?
    expect(productDetail).to be_valid
  end

  it "詳細がない場合、無効である" do
    productDetail =FactoryBot.build(:product_detail, description: nil)
    productDetail.valid?
    expect(productDetail.errors[:description]).to include("を入力してください")
  end

   it "商品IDがない場合、無効である" do
    productDetail =FactoryBot.build(:product_detail, product_id: nil)
    productDetail.valid?
    expect(productDetail.errors[:product_id]).to include()
  end
end


