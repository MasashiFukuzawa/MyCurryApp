if Shop.count < 1
  Shop.create!(name: "定食堂 金剛石",
              phone: "06-7174-2578",
              address: "大阪府大阪市中央区瓦屋町1-8-25 ハイツ松屋町 1F",
              area: "大阪",
              station: "松屋町駅",
              twitter_url: "/currykenmiconos",
              facebook_url: "/pages/%E5%AE%9A%E9%A3%9F%E5%A0%82-%E9%87%91%E5%89%9B%E7%9F%B3/1282365808537392",
              tabelog_url: "/osaka/A2701/A270204/27097683/",
              google_map_url: "/embed?pb=!1m18!1m12!1m3!1d3281.281218887639!2d135.51015501549085!3d34.67285129221635!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6000e738ed2ca30b%3A0xb6f8812bc6ad0ec!2z5a6a6aOf5aCCIOmHkeWJm-efsw!5e0!3m2!1sja!2sjp!4v1547992275505",
              business_hour: "木〜月：11:30～14:00(L.O.)、18:30～21:00(L.O.)\n火：11:30〜16:00（L.O)、夜営業無し\n日曜営業",
              holiday: "水曜日",
              access: "松屋町駅から徒歩4分（350m）、駐車場なし")
end

if Rails.env.development?
  if Shop.count < 2
    99.times do
      Shop.create!(name: Faker::Food.spice,
                  phone: Faker::PhoneNumber.cell_phone,
                  address: Faker::Address.full_address,
                  area: Faker::Address.state,
                  station: "#{Faker::Address.street_name}駅",
                  google_map_url: Faker::Address.state)
    end
  end

  if User.count < 2
    User.create!(name:  "admin",
    email: "m.fukuzawa0316@gmail.com",
    description: "管理者です。",
    password:              "admin_pass",
    password_confirmation: "admin_pass")
    
    99.times do |n|
      User.create!(name: Faker::DragonBall.character,
      email: "example-#{n+1}@example.com",
      password: "password",
      password_confirmation: "password")
    end
  end
  
  if Comment.count < 1
    User.first.comments.create!(
      body: "美味しすぎてカレーの概念が変わりました。",
      shop: Shop.find(1),
      created_at: Time.zone.now)
      
    50.times do
      User.all.sample.comments.create!(
        body: Faker::ChuckNorris.fact,
        shop: Shop.find(1),
        created_at: 2.hours.ago)
    end
      
    30.times do
      User.all.sample.comments.create!(
        body: Faker::ChuckNorris.fact,
        shop: Shop.find(2),
        created_at: 5.hours.ago)
    end
      
    100.times do
      User.all.sample.comments.create!(
          body: Faker::ChuckNorris.fact,
          shop: Shop.all.sample,
          created_at: 5.days.ago)
    end  
  end

  if Like.count < 1
    User.first.likes.create!(shop: Shop.find(1))
    
    49.times do |n|
      User.find(n + 2).likes.create!(shop: Shop.find(1))
    end
  end
end