class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.text :image_data
      t.references :user, foreign_key: true
      t.references :shop, foreign_key: true

      t.timestamps
    end
  end
end
