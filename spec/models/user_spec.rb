require 'rails_helper'

describe User do
  it {allow_value :user}
  it {is_expected.to validate_presence_of :name}
  it {validate_length_of :name}
  it {is_expected.to validate_presence_of :email}
  it {is_expected.to validate_presence_of :password}
  
  # メールアドレスが重複しない
  it "is invalid with a duplicate email address" do
    user = FactoryBot.create(:user, email: "curry@example.com")
    other_user = FactoryBot.build(:user, email: "curry@example.com")
    other_user.valid?
    expect(other_user.errors[:email]).to include("はすでに存在します")
  end
  
end
