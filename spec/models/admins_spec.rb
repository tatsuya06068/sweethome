require 'rails_helper'
RSpec.describe Admins, type: :model do

    it "パスワード,emailがある場合、有効である" do 
      admin = create(:admin)
      admin.valid?
      expect(admin).to be_valid
    end

    it "emailがない場合、無効である" do
      admin = FactoryBot.build(:admin, email: nil)
      admin.valid?
      expect(admin.errors[:email]).to include("を入力してください")
    end

    it "パスワードがない場合、無効である" do
      admin = FactoryBot.build(:admin, password: nil)
      admin.valid?
      expect(admin.errors[:password]).to include("を入力してください")
    end

    it "パスワードが暗号化されているか" do
      admin = FactoryBot.create(:admin)
      expect(admin.encrypted_password).to_not eq "password"
    end
end
