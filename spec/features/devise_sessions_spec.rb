require 'rails_helper'

feature "DeviseSessions" do
  scenario "user login and logout successfully" do
    user = create(:user)
    
    visit root_path
    
    click_link "ログイン"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).to have_content "ログインしました。"
    
    click_link "アカウント"
    click_link "ログアウト"
    expect(page).to have_content "ログアウトしました。"
  end
  
  scenario "user does not login successfully" do
    user = create(:user)
    
    visit root_path
    click_link "ログイン"
    click_button "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが無効です"
    
    fill_in "パスワード", with: user.password
    click_button "ログイン"
    expect(page).to have_content "メールアドレスまたはパスワードが無効です"

    fill_in "メールアドレス", with: user.email
    click_button "ログイン"
    expect(page).to have_content "パスワードを正しく入力して下さい。"
  end
end