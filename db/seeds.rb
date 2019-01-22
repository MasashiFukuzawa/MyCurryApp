Shop.create!(name: "定食堂 金剛石",
             phone: "0671742578",
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

99.times do |n|
  name = Faker::Food.spice
  phone = "000123400#{n+1}"
  address = Faker::Address.full_address
  area = Faker::Address.state
  station = "#{Faker::Address.street_name}駅"
  Shop.create!(name: name,
               phone: phone,
               address: address,
               area: area,
               station: station)
end