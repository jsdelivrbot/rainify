class PaymentsController < AuthenticatedController
	def index
	end

	def show
		payment = ShopifyAPI::RecurringApplicationCharge.find(params[:charge_id])
		payment.activate
		current_shop.update_attributes(charge: params[:charge_id])
		redirect_to root_path
	end

	def sign_up_recurring
		payment = ShopifyAPI::RecurringApplicationCharge.new
		payment.name = "Monthly Rainify Charge"
		payment.price = "2.99"
		payment.return_url = "http:\/\/rainify.herokuapp.com/payments/activate"
		payment.save

		redirect_to payment.confirmation_url
	end
end

