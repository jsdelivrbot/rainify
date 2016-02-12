ShopifyApp.configure do |config|
  config.api_key = ENV['key']
  config.secret = ENV['secret']
  config.redirect_uri = "rainify.herokuapp.com/shopify/callback"
  config.scope = "write_script_tags, read_script_tags"
  config.embedded_app = true
end
ShopifyAPI::Session.setup({:api_key => ENV['key'], :secret => ENV['secret']})