require 'rails_helper'

describe Comment do
  describe "comment validation" do
    it {allow_value :comment}
    it {is_expected.to validate_presence_of :title}
    it {is_expected.to validate_presence_of :body}
    it {validate_length_of :title}
    it {validate_length_of :body}
  end
  
  describe "comment association" do
    it {belong_to :user}
    it {belong_to :shop}
  end
end