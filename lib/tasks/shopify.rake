namespace :shopify do
  desc "Updates scripts to prevent free loaders"
  task :update_scripts => :environment do
		Shop.all.each do |shop|
			begin
		    shop.with_shopify_session do # New API session
			  	if shop.expiration > DateTime.now # Still in trial mode.
			    elsif shop.charge # a payment had been made in the past..
			      if ShopifyAPI::RecurringApplicationCharge.find(shop.charge).status == "cancelled" || "declined" || "expired" #Installed at one point, now freeloading.
				      ShopifyAPI::ScriptTag.all.each do |script|
				        if script.src == "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
				          script.destroy
				        end
				      end   			      	
			      end
			  	else # The trial expired, the app is installed, and they need to pay.
			      ShopifyAPI::ScriptTag.all.each do |script|
			        if script.src == "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
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
  desc "Give Free"
  task :give_free => :environment do
		Shop.all.where(shopify_domain: "peach-puddle.myshopify.com").each do |shop|
			session = ShopifyAPI::Session.new(shop.shopify_domain, shop.shopify_token)
			ShopifyAPI::Base.activate_session(session)
			new_script = ShopifyAPI::ScriptTag.new
  		new_script.event = "onload"
  		new_script.src = "https://cdn.jsdelivr.net/gh/Tommyixi/rainify/public/rainify.js"
  		new_script.save					
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