class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.string :name, null: false
      t.string :phone, null: false
      t.string :image_data
      t.string :address, null: false
      t.string :area, null: false
      t.string :station, null: false
      t.string :url
      t.string :twitter_url
      t.string :facebook_url
      t.string :tabelog_url
      t.string :google_map_url

      t.timestamps
    end
  end
end
