class AddChargeToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :charge, :integer
  end
end
