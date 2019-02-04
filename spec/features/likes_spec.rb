require 'rails_helper'

feature "Likes" do
  scenario "user create and destroy a like", js: true do
    user = create(:user)
    shop = create(:shop)

    login_as(user)
    visit root_path
    
    click_link "全ての店舗を見る"
    click_link "美味しいカレー屋さん", match: :first
    page.first("#link-mark").click
    visit "/likes"
    expect(page).to have_link "美味しいカレー屋さん"
    
    click_link "美味しいカレー屋さん"
    page.first("#link-mark").click
    expect(page).to_not have_link "美味しいカレー屋さん"
  end
end