require 'stripe'
class CheckoutController < ApplicationController

	def create
		instrument = Instrument.find(params[:id])
		@session = Stripe::Checkout::Session.create({
			customer: current_user.stripe_customer_id,
			payment_method_types: ['card'],
			line_items: [{
				    name: instrument.title,
					amount: instrument.price,
					currency: "inr",
					# price: instrument.stripe_price_id,
					quantity: 1
				}],
			mode: 'payment',
			success_url: root_url,
			cancel_url: root_url,
		})
		respond_to do |format|
			format.js
		end
	end

end