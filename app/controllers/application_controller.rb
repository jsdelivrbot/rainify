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
    elsif current_shop.charge # a payment had been made in the past..
      if ShopifyAPI::RecurringApplicationCharge.find(current_shop.charge).status == "cancelled" || "declined" #The app was uninstalled
        redirect_to payments_path  
      end
  	else # The trial expired, the app is installed, and they need to pay.
      ShopifyAPI::ScriptTag.all.each do |script|
        if script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
          script.destroy
        end
      end      
  		current_shop.update_attributes(rainify: false)
  		redirect_to payments_path
  	end
  end

  
end
