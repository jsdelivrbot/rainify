class HomeController < AuthenticatedController
  def index
    @shop = current_shop


    	new_script = ShopifyAPI::ScriptTag.new
    	new_script.event = "onload"
    	new_script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify.js"
    	new_script.save

  end
end