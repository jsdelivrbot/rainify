class ApplicationController < ActionController::Base
  include ShopifyApp::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_shop
		Shop.find(session[:shopify])
  end

  def check_payment
  	if current_shop.expiration > DateTime.now
      if current_shop.charge # a payment had been made in the past..
        if ShopifyAPI::RecurringApplicationCharge.find(current_shop.charge).status == "cancelled" || "declined" || "expired" #The app was uninstalled
          redirect_to payments_path 
        elsif ShopifyAPI::RecurringApplicationCharge.find(current_shop.charge).status == "active" || "pending" || "accepted" 
        end
    	else # The trial expired, the app is installed, and they need to pay.
        ShopifyAPI::ScriptTag.all.each do |script|
          if script.src == "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
            script.destroy
          end
        end     
    		current_shop.update_attributes(rainify: false)
    		redirect_to payments_path
    	end
    end
  end

  
end