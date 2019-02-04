require 'rails_helper'

feature "DeviseRegistrations" do
  scenario "user signup, edit and destroy" do
    visit root_path

    click_link "新規登録"
    fill_in "ユーザー名", with: "sample"
    fill_in "メールアドレス", with: "sample@example.com"
    fill_in "パスワード", with: "1111"
    fill_in "パスワード (確認)", with: "1111"
    click_button "新規登録"
    expect(page).to have_content "アカウント登録を受け付けました。"
    
    click_link "アカウント"
    click_link "設定"
    fill_in "ユーザー名", with: "テスト"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "自己紹介文", with: "RSpecの勉強中です。"
    # attach_file 'プロフィール画像', "#{Rails.root}/spec/files/test.png"
    fill_in "パスワード", with: "0000"
    fill_in "パスワード (確認)", with: "0000"
    fill_in "現在のパスワード", with: "1111"
    click_button "ユーザー情報を更新"
    expect(page).to have_current_path "/"
    expect(page).to have_content "アカウントが更新されました。"
    
    click_link "アカウント"
    click_link "設定"
    expect(page).to have_field 'ユーザー名', with: "テスト"
    expect(page).to have_field 'メールアドレス', with: "test@example.com"
    expect(page).to have_field '自己紹介文', with: "RSpecの勉強中です。"
    
    click_link "アカウントを削除"
    expect(page.driver.browser.switch_to.alert.text).to eq "アカウントを削除するとデータが全て削除されます。\n本当によろしいですか？"
    page.driver.browser.switch_to.alert.dismiss
    click_link "アカウントを削除"
    expect(page.driver.browser.switch_to.alert.text).to eq "アカウントを削除するとデータが全て削除されます。\n本当によろしいですか？"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_current_path "/"
    expect(page).to have_content "アカウントを削除しました。またのご利用をお待ちしております。" 
  end
  
  scenario "user does not signup" do
    user = create(:user)
    
    visit root_path
    
    click_link "新規登録"
    click_button "新規登録"
    expect(page).to have_content "メールアドレスを入力してください"
    expect(page).to have_content "パスワードを入力してください"
    expect(page).to have_content "ユーザー名を入力してください"
    
    fill_in "ユーザー名", with: user.name
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    fill_in "パスワード (確認)", with: user.password
    click_button "新規登録"
    expect(page).to have_content "メールアドレスはすでに存在します"
  end
  
  scenario "user does not edit" do
    user = create(:user)
    login_as(user)

    visit root_path
    click_link "アカウント"
    click_link "設定"
    click_button "ユーザー情報を更新"
    expect(page).to have_content "Current passwordを入力してください"
  end
end