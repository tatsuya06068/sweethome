require 'rails_helper'

  describe '商品一覧表示画面',type: :system do
      before do
        admin_user = FactoryBot.create(:admin, email: '1@111.com', password: '123456')
        visit new_admin_session_path
        fill_in 'email', with: admin_user.email
        fill_in 'password', with: admin_user.password
        click_button 'ログイン'
        click_link '商品'
      end
    
    describe '商品一覧表示確認',type: :system do
      context '商品一覧に２件表示されている場合' do
        let!(:product_find) {FactoryBot.create(:product, name: 'test')}
        let!(:materials_used) { FactoryBot.create(:materials_used)}
        before do
          visit current_path
        end
        it '2件表示されていること' do
          tr = Capybara.all('table tbody tr')
          expect(tr.size).to eq(2) 
        end
        
        it '商品名が表示されていること' do
          expect(Capybara.find('table').native.to_s).to have_text(product_find.name) 
        end
        
        it 'カテゴリー名が表示されていること' do
          expect(Capybara.find('table').native.to_s).to have_text(product_find.category.name)
        end
        example '材料名が表示されていること' do
          expect(Capybara.find('table').native.to_s).to have_text(materials_used.material.name)
        end
      end
    end
    
    describe '検索機能' do
      context 'カテゴリー：５件、材料４件登録されている場合' do
        before do
          FactoryBot.create_list(:material, 5)
          FactoryBot.create_list(:category, 4)
          visit current_path
        end
        
        describe 'セレクト表示確認' do
          
          it '材料名が表示されていること' do
            expect(Capybara.find_by_id('q_materials_id_eq').all('option').size).to eq(6) #空白option含む
          end
          it 'カテゴリー名が表示されていること' do
            expect(Capybara.find_by_id('q_category_id_eq').all('option').size).to eq(5) #空白option含む 
          end 
        end 
        
        describe '検索確認' do
          context '商品が５件登録されている場合' do
            let!(:product_search) {FactoryBot.create_list(:product, 5)}
            let!(:materials_used) {FactoryBot.create_list(:materials_used, 5)}
            before do
              FactoryBot.create(:category)
            end
              context 'カテゴリーを選択して検索した場合' do
                before do
                  visit current_path    
                  select(option=product_search[1].category.name, from: "q[category_id_eq]")
                  click_button '検索'
                end
                it '選択したカテゴリーを含む商品が表示されること' do
                  expect(Capybara.find('table').native.to_s).to have_text(product_search[1].category.name) 
                end
                it '選択したカテゴリーを含む商品以外表示されないこと'do
                  expect(Capybara.find('table')).not_to have_text(product_search[2].category.name)
                end
              end
              context '材料を選択して検索した場合' do
                before do
                  visit current_path    
                  select(option=materials_used[1].material.name, from: "q[materials_id_eq]")
                  click_button '検索'
                end
                 it '選択した材料を含む商品が表示されること'do
                   expect(Capybara.find('table')).to have_text(materials_used[1].material.name)
                end
                
                it '選択した材料以外は表示されていないこと' do
                  expect(Capybara.find('table')).not_to have_text(materials_used[0].material.name)
                end
              end
            context '材料とカテゴリーを選択して検索した場合' do
              before do   
                  visit current_path    
                  select(option=materials_used[1].product.category.name, from: "q[category_id_eq]")
                  select(option=materials_used[1].material.name, from: "q[materials_id_eq]")
                  click_button '検索'
              end
              it '選択した項目を含む商品が表示されること' do
                expect(Capybara.find('table').native.to_s).to have_text(materials_used[1].product.category.name) &  have_text(materials_used[1].material.name)
              end
            end
          end  
        end
      end
    end
  end

describe '詳細画面確認', type: :system do
  context '任意の商品を選択後' do
    before do
        
    end

    it '選択した商品の詳細画面が表示すること'
  end  
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

