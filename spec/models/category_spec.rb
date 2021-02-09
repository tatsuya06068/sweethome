require 'rails_helper'

RSpec.describe Category, type: :model do
  it "カテゴリー名がある場合、有効である" do
    category = FactoryBot.build(:category)
    category.valid?
    expect(category).to be_valid
  end

  it "カテゴリー名がない場合、無効である" do
    category = FactoryBot.build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("を入力してください")
  end
end


