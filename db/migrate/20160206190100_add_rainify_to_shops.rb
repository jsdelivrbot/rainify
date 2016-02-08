class AddRainifyToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :rainify, :boolean, default: false
  end
end
