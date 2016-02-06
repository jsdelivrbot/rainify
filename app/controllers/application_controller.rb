class ApplicationController < ActionController::Base
  include ShopifyApp::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ShopifyAPI::Session.setup({:api_key => ENV['key'], :secret => ENV['secret']})
end
