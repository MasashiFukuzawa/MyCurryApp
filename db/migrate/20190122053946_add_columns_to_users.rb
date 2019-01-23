class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :location, :string
    add_column :users, :description, :text
  end
end
