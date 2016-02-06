class HomeController < AuthenticatedController
  def index
  	shop = ShopifyAPI::Shop.current
    @products = ShopifyAPI::Theme.find(:all, :params => {:limit => 10})
  end
end
