require 'rails_helper'

describe Shop do
  describe "shop validation" do
    it {allow_value :shop}
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :phone}
    it {is_expected.to validate_presence_of :address}
    it {is_expected.to validate_presence_of :area}
    it {is_expected.to validate_presence_of :station}
    it {validate_length_of :name}
    it {validate_length_of :address}
    it {validate_length_of :area}
    it {validate_length_of :station}
    
    it "has valid length of a phone number and is number" do
      shop = FactoryBot.build(:shop, phone: "1" * 10)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = FactoryBot.build(:shop, phone: "0" * 9)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = FactoryBot.build(:shop, phone: "0" * 12)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = FactoryBot.build(:shop, phone: "a" * 10)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
    end
    
    it "has unique phone number" do
      shop1 = FactoryBot.create(:shop, phone: "0" * 10)
      expect(shop1).to be_valid
      shop2 = FactoryBot.build(:shop, phone: "0" * 10)
      shop2.valid?
      expect(shop2.errors[:phone]).to include("はすでに存在します")
    end
  end
  
  describe "shop association" do
    it {have_many :users}
    it {have_many :comments}
  end
end
