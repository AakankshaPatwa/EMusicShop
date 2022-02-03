class ChargesController < ApplicationController
  def create
    instrument = Instrument.find(params[:id])
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: [{
        name: instrument.title,
        amount: instrument.price,
        currency: "usd",
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

  # def new
  # end

  # def create
  # # Amount in cents
  # @amount = 500
  # # Stripe.api_key = 'sk_test_51KLM1sSFDNiRd0Tld5MdiutK92ggcFJObpX2d1cMqPBtIdGGjRnUZulbroTfCkmDymVAzXkTKB6oXheOe7SRVKm100WAb6kHqJ'
  # customer = Stripe::Customer.create({
  #   email: params[:stripeEmail],
  #   source: params[:stripeToken],
  # })

  # charge = Stripe::Charge.create({
  #   customer: customer.id,
  #   amount: @amount,
  #   description: 'Rails Stripe customer',
  #   currency: 'usd',
  # })

  # rescue Stripe::CardError => e
  #   flash[:error] = e.message
  #   redirect_to new_charge_path
  # end



  
  