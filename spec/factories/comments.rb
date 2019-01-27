FactoryBot.define do
  factory :comment do
    title "三丁目のカルダモン"
    body "美味しすぎてカレーの概念が変わりました。"
    association :user, :shop
  end
end