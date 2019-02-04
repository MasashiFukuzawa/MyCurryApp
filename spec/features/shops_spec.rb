require 'rails_helper'

feature "Shops" do
  scenario "user search a shop" do
    shop = create(:shop)
    visit root_path

    fill_in "search", with: shop.name
    click_button "検索"
    expect(page).to have_link shop.name
  end
end