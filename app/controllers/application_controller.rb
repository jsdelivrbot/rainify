class ApplicationController < ActionController::Base
  include ShopifyApp::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_shop
		Shop.find(session[:shopify])
  end

  def check_payment
  	if current_shop.expiration > DateTime.now # Still in trial mode.
    elsif current_shop.charge != "nil" # a payment had been made in the past..
      if ShopifyAPI::RecurringApplicationCharge.find(current_shop.charge).status == "cancelled" #The app was uninstalled
        redirect_to payments_path  
      end
  	else # The trial expired, the app is installed, and they need to pay.
  		current_shop.update_attributes(rainify: false)
  		redirect_to payments_path
  	end
  end

  
end
