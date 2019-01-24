FactoryBot.define do
  factory :profile do
    twitter_image { "MyString" }
    location { "MyString" }
    description { "MyText" }
    image_data { "MyString" }
    user { nil }
  end
end
