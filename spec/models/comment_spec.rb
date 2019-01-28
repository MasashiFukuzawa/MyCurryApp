require 'rails_helper'

describe Comment do
  describe "comment validation" do
    it {allow_value :comment}
    it {is_expected.to validate_presence_of :body}
    it {is_expected.to validate_presence_of :user}
    it {is_expected.to validate_presence_of :shop}
    it {validate_length_of :body}
  end
  
  describe "comment association" do
    it {belong_to :user}
    it {belong_to :shop}
  end
end