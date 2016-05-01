class AddExpirationToShops < ActiveRecord::Migration
  def change
  	add_column :shops, :expiration, :datetime, default: DateTime.now + 2.days
  end
end
