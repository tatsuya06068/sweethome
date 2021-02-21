require 'rails_helper'

describe '管理者ログイン', type: :system do
    let (:admin_user) { create(:admin) } 
    it '成功すること' do
      visit new_admin_session_path
      fill_in 'email', with: admin_user.email
      fill_in 'password', with: admin_user.password
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました'
    end
    context 'emailが違う場合' do
      it '失敗すること' do
       visit new_admin_session_path
       fill_in 'email', with: 'test.test.com'
       fill_in 'password', with: admin_user.password
       click_button 'ログイン'
       expect(page).to have_content 'Emailまたはパスワードが違います。'
      end
    end
    context 'passwordが違う場合' do
      it '失敗すること' do
        visit new_admin_session_path
        fill_in 'email', with: 'test.test.com'
        fill_in 'password', with: admin_user.password
        click_button 'ログイン'
        expect(page).to have_content 'Emailまたはパスワードが違います。'
      end
    end
  end
