class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :phone
      t.string :image_data
      t.string :address
      t.string :area
      t.string :station
      t.string :url
      t.string :twitter_url
      t.string :facebook_url
      t.string :tabelog_url
      t.string :google_map_url

      t.timestamps
    end
  end
end
