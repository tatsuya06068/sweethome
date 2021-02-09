require 'rails_helper'

RSpec.describe Material, type: :model do
  it "材料名がある場合、有効である" do
    material = FactoryBot.build(:material)
    material.valid?
    expect(material).to be_valid
  end

  it "材料名がない場合、無効である" do
    material = FactoryBot.build(:material, name: nil)
    material.valid?
    expect(material.errors[:name]).to include("を入力してください")
  end
end

