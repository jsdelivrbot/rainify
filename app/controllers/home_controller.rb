class HomeController < AuthenticatedController
  def index
    @products = ShopifyAPI::Theme.find(:all, :params => {:limit => 10})
    @shop = current_shop

    ShopifyAPI::Theme.all.each do |theme|
    	if theme.role == "main"
    		@main_theme = theme
    	end
    end

    rain_asset = ShopifyAPI::Asset.new
    rain_asset.key = ('assets/rain.png')
    rain_asset.src = "http://rainify.herokuapp.com/assets/rain.png"
    rain_asset.theme_id = @main_theme.id
    rain_asset.prefix_options[:theme_id] = @main_theme.id
    rain_asset.save
  end
end



