class AddExpirationToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :expiration, :datetime
  end
end
