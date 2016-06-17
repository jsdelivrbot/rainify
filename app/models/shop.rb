class Shop < ActiveRecord::Base
  include ShopifyApp::Shop
  include ShopifyApp::SessionStorage

  after_create :set_datetime

  def set_datetime
  	self.update_attributes(expiration: DateTime.now + 2.days)
  end

end
