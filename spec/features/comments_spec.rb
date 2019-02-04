require 'rails_helper'

feature "Comments" do
  scenario "user create a comment and destroy" do
    user = create(:user)
    shop = create(:shop)

    login_as(user)
    visit root_path

    click_link "店舗一覧"
    click_link "美味しいカレー屋さん", match: :first
    fill_in "コメント", with: "テスト"
    # attach_file("#comment_image", "#{Rails.root}/spec/files/test.png")
    click_button "コメントを投稿"
    expect(page).to have_content "コメントが投稿されました。"
    expect(page).to have_content "テスト"
    
    click_link "コメントを削除"
    expect(page.driver.browser.switch_to.alert.text).to eq "コメントを削除します。\n本当によろしいですか？"
    page.driver.browser.switch_to.alert.accept
    expect(page).to have_content "コメントを削除しました。"
    expect(page).to_not have_content "テスト"
  end

  scenario "user does not create a comment" do
    user = create(:user)
    shop = create(:shop, name: "辛めのカレー屋さん")

    login_as(user)
    visit root_path

    click_link "店舗一覧"
    click_link "辛めのカレー屋さん", match: :first
    click_button "コメントを投稿"
    expect(page).to have_content "投稿失敗しました。"
    expect(page).to_not have_content "テスト"
  end
end