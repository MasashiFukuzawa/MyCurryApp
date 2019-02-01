FactoryBot.define do
  factory :like do
    association :user, :shop
  end
end