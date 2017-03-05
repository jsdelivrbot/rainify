class WebhooksController < AuthenticatedController

  def uninstall
    shop = Shop.where(shopify_domain: params[:shopify_domain])
    shop.update_attributes(uninstall: true)
  end  
  
end
