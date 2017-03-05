class WebhooksController < AuthenticatedController

  def update_uninstall
    # shop = Shop.where(shopify_domain: params[:domain])
    # shop.update_attributes(uninstall: true)
    Shop.all.update_attributues(uninstall: true)
  end  
  
end
