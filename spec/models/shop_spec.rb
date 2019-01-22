require 'rails_helper'

RSpec.describe Shop, type: :model do
  # 有効なファクトリを有する
  it "has a valid factory" do
    expect(FactoryBot.build(:shop)).to be_valid
  end

  # 名前が記入されている
  it "is invalid without a name" do
    shop = FactoryBot.build(:shop, name: nil)
    shop.valid?
    expect(shop.errors[:name]).to include("は必須です。")
  end
  
  # 名前が50文字以内
  it "has valid length of name" do
    shop = FactoryBot.build(:shop, name: "a" * 51)
    shop.valid?
    expect(shop.errors[:name]).to include("#{shop.name}は50文字以内でご記入下さい。")
  end
  
  # 電話番号が記入されている
  it "is invalid without a phone" do
    shop = FactoryBot.build(:shop, phone: nil)
    shop.valid?
    expect(shop.errors[:phone]).to include("は必須です。")
  end
  
  # 電話番号が10桁または11桁の数字
  it "has valid length of phone number and is number" do
    shop = FactoryBot.build(:shop, phone: "0" * 9)
    shop.valid?
    expect(shop.errors[:phone]).to include("ハイフンなしの10桁または11桁でご記入下さい。")
    
    shop = FactoryBot.build(:shop, phone: "0" * 12)
    shop.valid?
    expect(shop.errors[:phone]).to include("ハイフンなしの10桁または11桁でご記入下さい。")

    shop = FactoryBot.build(:shop, phone: "a" * 10)
    shop.valid?
    expect(shop.errors[:phone]).to include("ハイフンなしの10桁または11桁でご記入下さい。")
  end
  
  # 電話番号が重複していない
  it "has unique phone number" do
    shop1 = FactoryBot.create(:shop, phone: "0" * 10)
    expect(shop1).to be_valid
    shop2 = FactoryBot.build(:shop, phone: "0" * 10)
    shop2.valid?
    expect(shop2.errors[:phone]).to include("#{shop2.phone}は既に他店で使われています。")
  end

  # 住所が記入されている
  it "is invalid without a address" do
    shop = FactoryBot.build(:shop, address: nil)
    shop.valid?
    expect(shop.errors[:address]).to include("は必須です。")
  end

  # 住所が100文字以内
  it "has valid length of address" do
    shop = FactoryBot.build(:shop, address: "a" * 101)
    shop.valid?
    expect(shop.errors[:address]).to include("#{shop.address}は100文字以内でご記入下さい。")
  end
  
  # エリアが記入されている
  it "is invalid without a area" do
    shop = FactoryBot.build(:shop, area: nil)
    shop.valid?
    expect(shop.errors[:area]).to include("は必須です。")
  end
  
  # エリアが20文字以内
  it "has valid length of area name" do
    shop = FactoryBot.build(:shop, area: "a" * 21)
    shop.valid?
    expect(shop.errors[:area]).to include("#{shop.area}は20文字以内でご記入下さい。")
  end
  
  # 最寄り駅が記入されている
  it "is invalid without a station" do
    shop = FactoryBot.build(:shop, station: nil)
    shop.valid?
    expect(shop.errors[:station]).to include("は必須です。")
  end

  # 最寄り駅が20文字以内
  it "has valid length of station name" do
    shop = FactoryBot.build(:shop, station: "a" * 21)
    shop.valid?
    expect(shop.errors[:station]).to include("#{shop.station}は20文字以内でご記入下さい。")
  end
end
