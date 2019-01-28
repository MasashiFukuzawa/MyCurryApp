FactoryBot.define do
  factory :comment do
    body "美味しすぎてカレーの概念が変わりました。"
    association :user, :shop
  end
end