class ChargesController < ApplicationController
 def create
  # Amount in cents
  @amount = 500
  Stripe.api_key = Rails.application.credentials[:stripe][:secret]

  customer = Stripe::Customer.create({
     email: params[:stripeEmail],
    source: params[:stripeToken],
  })
 
  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'inr',
  })

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
  # def create
  #   instrument = Instrument.find(params[:id])
  #   @session = Stripe::Checkout::Session.create({
  #     payment_method_types: ['card'],
  #     line_items: [{
  #       name: instrument.title,
  #       amount: instrument.price,
  #       currency: "inr",
  #       quantity: 1
  #     }],
  #     mode: 'payment',
  #     success_url: root_url,
  #     cancel_url: root_url,
  #   })
  #   respond_to do |format|
  #     format.js
  #   end
  # end


  # def new
  # end

 



  
  