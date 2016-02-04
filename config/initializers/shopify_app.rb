ShopifyApp.configure do |config|
  config.api_key = ENV['key']
  config.secret = ENV['secret']
  config.redirect_uri = "http://shopify-rain.herokuapp.com/shopify/callback"
  config.scope = "read_orders, read_products"
  config.embedded_app = true
end
