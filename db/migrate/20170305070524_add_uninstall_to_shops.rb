class AddUninstallToShops < ActiveRecord::Migration
  def change
    add_column :shops, :uninstall, :boolean
  end
end
