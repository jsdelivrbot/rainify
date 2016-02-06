ShopifyApp.configure do |config|
  config.api_key = ENV['key']
  config.secret = ENV['secret']
  config.redirect_uri = "https://rainify.herokuapp.com/shopify/callback"
  config.scope = "write_themes"
  config.embedded_app = true
end
