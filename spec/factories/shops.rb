FactoryBot.define do
  factory :shop do
    name "美味しいカレー屋さん"
    sequence(:phone) {|n| "06-777#{n}-2222"}
    address "カルダモン1丁目1番1号"
    area "クミン"
    station "ターメリック駅"
    google_map_url "/embed?pb="
  end
end
