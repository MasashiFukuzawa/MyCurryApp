require 'rails_helper'

describe Shop do
  describe "shop validation" do
    it {allow_value :shop}
    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_presence_of :phone}
    it {is_expected.to validate_presence_of :address}
    it {is_expected.to validate_presence_of :area}
    it {is_expected.to validate_presence_of :station}
    it {is_expected.to validate_presence_of :google_map_url}
    it {validate_length_of :name}
    it {validate_length_of :address}
    it {validate_length_of :area}
    it {validate_length_of :station}
    
    it "has valid phone number" do
      shop = build(:shop, phone: "1" * 10)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = build(:shop, phone: "0" * 9)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = build(:shop, phone: "0" * 12)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
      
      shop = build(:shop, phone: "a" * 10)
      shop.valid?
      expect(shop.errors[:phone]).to include("は不正な値です")
    end
    
    it "has unique phone number" do
      shop1 = create(:shop)
      expect(shop1).to be_valid
      shop2 = build(:shop)
      shop2.valid?
      expect(shop2.errors[:phone]).to include("はすでに存在します")
    end
  end
  
  describe "shop association" do
    it {have_many :users}
    it {have_many :comments}
    it {have_many :likes}
  end

  describe "search function" do
    it "returns shops that match ther search term" do
      shop1 = create(:shop)
      shop2 = create(:shop, name: "よそみシーズン2", phone: "06-7770-2222")
      shop3 = create(:shop, name: "ガネーシュN", phone: "06-7771-2222")
      shop4 = create(:shop, name: "ガネーシュM", phone: "06-7772-2222")

      expect(Shop.search("ガネーシュ")).to_not include(shop1, shop2)
      expect(Shop.search("ガネーシュ")).to include(shop3, shop4)
      expect(Shop.search("06-7777-2222")).to include(shop1)
      expect(Shop.search("0677772222")).to_not include(shop1, shop2, shop3, shop4)
      expect(Shop.search("カルダモン1丁目1番1号")).to include(shop1, shop2, shop3, shop4)
      expect(Shop.search("カルダモン2丁目")).to_not include(shop1, shop2, shop3, shop4)
      expect(Shop.search("クミン")).to include(shop1, shop2, shop3, shop4)
      expect(Shop.search("ターメリック")).to include(shop1, shop2, shop3, shop4)
    end
  end
end