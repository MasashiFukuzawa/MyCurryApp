require 'rails_helper'

describe Like do
  describe "like validation" do
    it {allow_value :like}
    it {is_expected.to validate_presence_of :user}
    it {is_expected.to validate_presence_of :shop}
  end

  describe "like association" do
    it {belong_to :user}
    it {belong_to :shop}
  end
end