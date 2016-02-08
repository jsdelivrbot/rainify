class ShopsController < ApplicationController

	def toggle
  	@shop = current_shop
  	@shop.update_attributes(:rainify => params[:rainify])
  	render :nothing => true
  end
end
