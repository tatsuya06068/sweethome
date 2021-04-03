require 'rails_helper'

describe '管理者ログイン', type: :system do
    let (:admin_user) { create(:admin) } 
    before do 
      visit new_admin_session_path
    end
    it '成功すること' do
      fill_in 'email', with: admin_user.email
      fill_in 'password', with: admin_user.password 
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました'
    end
    context 'emailが違う場合' do
      it '失敗すること' do
       fill_in 'email', with: 'test@test.com'
       fill_in 'password', with: admin_user.password
       click_button 'ログイン'
       expect(page).to have_content 'Emailまたはパスワードが違います。'
      end
    end
    context 'passwordが違う場合' do
      it '失敗すること' do
        fill_in 'email', with: admin_user.email
        fill_in 'password', with: 'aaaaaa'
        click_button 'ログイン'
        expect(page).to have_content 'Emailまたはパスワードが違います。'
      end
    end
  end
