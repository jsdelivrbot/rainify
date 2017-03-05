class PaymentsController < AuthenticatedController
	def index
	end

	def show
		payment = ShopifyAPI::RecurringApplicationCharge.find(params[:charge_id])
		payment.activate
		current_shop.update_attributes(charge: params[:charge_id])
		redirect_to "/"
	end

	def sign_up_recurring
		payment = ShopifyAPI::RecurringApplicationCharge.new
		payment.name = "Monthly Rainify Charge"
		payment.price = "1.99"
		payment.return_url = "http:\/\/rainify.herokuapp.com/payments/activate"
		payment.save
		new_script = ShopifyAPI::ScriptTag.new
  	new_script.event = "onload"
  	new_script.src = "https://rawgit.com/Tommyixi/rainify/master/public/rainify_paid.js"
  	new_script.save

		redirect_to payment.confirmation_url
	end
end

