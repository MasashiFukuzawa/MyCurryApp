class AddColumnToShop < ActiveRecord::Migration[5.2]
  def change
    add_column :shops, :business_hour, :text
    add_column :shops, :holiday, :string
    add_column :shops, :access, :text
  end
end
