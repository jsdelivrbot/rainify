class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Theme.find(:all, :params => {:limit => 10})
    @shop = current_shop

    ShopifyAPI::Theme.all.each do |theme|
    	if theme.role == "main"
    		@main_theme = theme
    	end
    end

    if @shop.rainify
	    rain_asset_image = ShopifyAPI::Asset.new
	    rain_asset_image.key = ('assets/rainify.png')
	    rain_asset_image.src = ActionController::Base.helpers.asset_path('rain.png')
	    rain_asset_image.theme_id = @main_theme.id
	    rain_asset_image.prefix_options[:theme_id] = @main_theme.id
	    rain_asset_image.save

	    rain_asset_css = ShopifyAPI::Asset.new
	    rain_asset_css.key = ('assets/rainify.css')
	    rain_asset_css.theme_id = @main_theme.id
	    rain_asset_css.prefix_options[:theme_id] = @main_theme.id
	    rain_asset_css.value = "body{background:url(rain.png);height:100%;left:0;position:absolute;top:0;width:100%;z-index:0;-webkit-animation:snow 3s linear infinite;-moz-animation:snow 3s linear infinite;-ms-animation:snow 3s linear infinite;animation:snow 3s linear infinite}@keyframes snow{0%{background-position:0 0,0 0,0 0}100%{background-position:0 1000px,0 400px,0 300px}}@-moz-keyframes snow{0%{background-position:0 0,0 0,0 0}100%{background-position:400px 1000px,200px 400px,100px 300px}}@-webkit-keyframes snow{0%{background-position:0 0,0 0,0 0}100%{background-position:500px 1000px,200px 400px,-100px 300px}}@-ms-keyframes snow{0%{background-position:0 0,0 0,0 0}100%{background-position:500px 1000px,200px 400px,-100px 300px}}"
	    rain_asset_css.save	  

	    rain_asset_js = ShopifyAPI::Asset.new
	    rain_asset_js.key = ('assets/rainify.js')
	    rain_asset_js.theme_id = @main_theme.id
	    rain_asset_js.prefix_options[:theme_id] = @main_theme.id
	    rain_asset_js.value = "$(document).ready(function(){$('body').height($(document).height())})"
	    rain_asset_js.save	  	      
    end

  end
end