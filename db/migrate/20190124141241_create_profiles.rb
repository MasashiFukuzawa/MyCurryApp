class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :twitter_image
      t.string :location
      t.text :description
      t.string :image_data

      t.timestamps
    end
  end
end
