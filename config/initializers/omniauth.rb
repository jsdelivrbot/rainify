Rails.application.config.middleware.use OmniAuth::Builder do
  provider :shopify,
    ShopifyApp.configuration.api_key,
    ShopifyApp.configuration.secret,
    redirect_uri: "http://rainify.herokuapp.com/auth/shopify/callback",
    scope: ShopifyApp.configuration.scope
end
