ShopifyApp.configure do |config|
  config.api_key = ENV['key']
  config.secret = ENV['secret']
  config.redirect_uri = "http://rainify.herokuapp.com/auth/shopify/callback"
  config.scope = "write_script_tags, read_script_tags"
  config.embedded_app = true

  config.webhooks = [
    {topic: "app/uninstalled", address: "http://rainify.herokuapp.com/update_uninstall"}
  ]  

end
ShopifyAPI::Session.setup({:api_key => ENV['key'], :secret => ENV['secret']})