class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :shop, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :likes, [:user_id, :shop_id], unique: true
  end
end
