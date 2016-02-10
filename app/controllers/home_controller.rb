class HomeController < AuthenticatedController
  def index
    @shop = current_shop

    if @shop.rainify
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

  end
end