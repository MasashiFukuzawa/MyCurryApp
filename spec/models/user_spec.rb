require 'rails_helper'

describe User do
  describe "user validation" do
    it {allow_value :user}
    it {is_expected.to validate_presence_of :name}
    it {validate_length_of :name}
    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :password}
    it {validate_length_of :password}
    
    it "is invalid with a duplicate email address" do
      user = FactoryBot.create(:user, email: "curry@example.com")
      other_user = FactoryBot.build(:user, email: "curry@example.com")
      other_user.valid?
      expect(other_user.errors[:email]).to include("はすでに存在します")
    end
  end

  describe "user association" do
    it {have_one :profile}
    it {have_many :comments}
    it {have_many :shop}
  end
  
end
