class ShopsController < AuthenticatedController

	def toggle
  	current_shop.update_attributes(:rainify => params[:rainify])
  	if current_shop.rainify
    	new_script = ShopifyAPI::ScriptTag.new
    	new_script.event = "onload"
    	new_script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
    	new_script.save
    else
    	ShopifyAPI::ScriptTag.all.each do |script|
    		if script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
    			script.destroy
    		end
    	end
    end
  	render :nothing => true
  end
end
