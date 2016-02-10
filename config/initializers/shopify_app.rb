ShopifyApp.configure do |config|
  config.api_key = ENV['key']
  config.secret = ENV['secret']
  config.redirect_uri = "localhost:3000/shopify/callback"
  config.scope = "write_script_tags, write_products, read_products"
  config.embedded_app = true
end
ShopifyAPI::Session.setup({:api_key => ENV['key'], :secret => ENV['secret']})


