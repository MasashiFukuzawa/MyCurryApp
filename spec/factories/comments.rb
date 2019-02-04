FactoryBot.define do
  factory :comment do
    body "美味しすぎてカレーの概念が変わりました。"
    # image {File.open("spec/files/test.png")}
    association :user, :shop
  end
end