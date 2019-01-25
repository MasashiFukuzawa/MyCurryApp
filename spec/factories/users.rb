FactoryBot.define do
  factory :user do
    name "Okano"
    sequence(:email) {|n| "curry#{n}@example.com"}
    password "Curry"
  end
end
