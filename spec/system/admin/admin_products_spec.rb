require 'rails_helper'

  describe '商品一覧表示画面',type: :system do
      let(:product) {FactoryBot.create(:product)}
      let(:materials_used) { FactoryBot.create(:materials_used)}
      before do
        admin_user = FactoryBot.create(:admin, email: '1@111.com', password: '123456')
        visit new_admin_session_path
        fill_in 'email', with: admin_user.email
        fill_in 'password', with: admin_user.password
        click_button 'ログイン'
        click_link '商品'
      end

    describe '商品一覧表示確認',type: :system do
      before do
        material = FactoryBot.create(:material)      
        product2 =  FactoryBot.create(:product)
        FactoryBot.create(:materials_used)
        visit current_path
      end
      example '登録されている商品が全て表示されていること' do
        tr = Capybara.all('table tbody tr')
        expect(tr.size).to eq(2) 
      end
        
      example '商品名が表示されていること' do
        expect(page).to have_text(product.name) 
      end
        
      example 'カテゴリー名が表示されていること' do
        expect(page).to have_text(product.category.name)
      end
      example '材料名が表示されていること' do
        expect(page).to have_text(materials_used.material.name)
      end
    end
    
    describe '検索機能' do
      
      describe 'セレクト表示確認' do
        
        it '材料名が表示されていること'
        
        it 'カテゴリー名が表示されていること'
       
      end
     end
    
    describe '検索確認' do
      
      context '材料選択時' do
        it '選択した材料を含む商品が表示されること'
      end
      
      context 'カテゴリー選択時' do
        it '選択したカテゴリーを含む商品が表示されること'
      end
      
      context '材料とカテゴリー選択時' do
        it '選択した材料とカテゴリーを含む商品が表示されること'
      end
      
    end
  end

describe '詳細画面確認', type: :system do
   it '選択した商品の詳細画面が表示すること'
    
end

describe '新規登録画面', type: :system do
    describe '材料追加、削除確認', js: true do
      describe '追加ボタン押下' do
         it '材料選択項目が増えること'
      end
      
      describe '削除ボタン押下' do
        context '材料選択項目が1つの場合' do
          it '削除ボタンが押せないこと'
         end
        
        context '材料選択項目が２つ以上の場合' do
          it '材料選択項目が1つ減ること'
        end
    end
    
end

  describe '必須項目確認' do
      
  end
end

describe '編集画面', type: :system do

end

