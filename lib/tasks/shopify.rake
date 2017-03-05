namespace :shopify do
  desc "Updates scripts to prevent free loaders"
  task :update_scripts => :environment do
		Shop.all.each do |shop|
			begin
		    shop.with_shopify_session do # New API session
			  	if shop.expiration > DateTime.now # Still in trial mode.
			    elsif shop.charge # a payment had been made in the past..
			      if ShopifyAPI::RecurringApplicationCharge.find(shop.charge).status == "cancelled" #Installed at one point, now freeloading.
				      ShopifyAPI::ScriptTag.all.each do |script|
				        if script.src == "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
				          script.destroy
				        end
				      end   			      	
			      end
			  	else # The trial expired, the app is installed, and they need to pay.
			      ShopifyAPI::ScriptTag.all.each do |script|
			        if script.src == "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
			          script.destroy
			        end
			      end      
			  		shop.update_attributes(rainify: false)
			  	end
		    end
		  rescue
		  	next
		  end
		end
  end
end


# Shop.all.each do |shop|
# 	begin
# 		session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
# 		ShopifyAPI::Base.activate_session(session)
# 		ShopifyAPI::ScriptTag.all.each do |script|
# 			print script.src
# 		end
# 	rescue
# 		next
# 	end
# end