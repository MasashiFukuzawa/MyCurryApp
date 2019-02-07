FactoryBot.define do
  factory :shop do
    name "美味しいカレー屋さん"
    sequence(:phone) {|n| "06-7777-2222"}
    address "カルダモン1丁目1番1号"
    area "クミン"
    station "ターメリック駅"
  end
end
