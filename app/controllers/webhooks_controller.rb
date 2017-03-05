class WebhooksController < AuthenticatedController

  def uninstall
    shop = Shop.where(shopify_domain: params[:domain])
    shop.update_attributes(uninstall: true)
  end  
  
end
