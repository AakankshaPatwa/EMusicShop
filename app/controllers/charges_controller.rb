class ChargesController < ApplicationController
  rescue_from Stripe::CardError, with: :catch_exception
  def new
  end

  def create
    StripeChargesServices.new(charges_params, current_user).call
    redirect_to new_charge_path
  end

  private

  def charges_params
    params.permit(:stripeEmail, :stripeToken, :order_id)
  end

  def catch_exception(exception)
    flash[:error] = exception.message
  end
end

  # def new
  # end
 
  # def create
    
    # binding.pry
    
    # byebug
  #   @amount = 500

  #   customer = Stripe::Customer.create(
  #   'name' => 'test',
  #   'description' => 'test description',
  #   'email' => params[:stripeEmail],
  #   #'source' => params[:stripeToken]#,
  #   )
  #   #customer = Stripe::Customer.create(email: params[:stripeEmail], source: params[:stripeToken])

  #   Stripe::Charge.create({
  #   :amount => @amount,
  #   :currency => "usd",
  #   :source => params[:stripeToken],
  #   :description => "Charge for test@example.com"
  # })
  # Set your secret key. Remember to switch to your live secret key in production.
# See your keys here: https://dashboard.stripe.com/apikeys


#   Stripe.api_key = 'sk_test_51KRSa9SBsGsaYp6jO2uiNA4cKdShYR7CEUKPrvmp48SkWwcpz9Y9T169ouwYkIkQKI9SBVTxWv4gU0qbSLUYGSdh00ISn7JTz2'

#   payment_intent = Stripe::PaymentIntent.create({
#     payment_method_types: ['card'],
#     amount: 1000,
#     currency: 'inr',
#   }, stripe_account: 'acct_1KRSa9SBsGsaYp6j')
#   flash[:notice] = "Successfully created a charge"
#   redirect_to root_path
#   rescue Stripe::CardError => e
#     flash[:error] = e.message
#     redirect_to new_charge_path
#   end
# end






#  def create
#   # Amount in cents
#   @amount = 500

#   # customer = Stripe::Customer.create({
#   #   email: params[:stripeEmail],
#   #   source: params[:stripeToken],
#   # })
 

#   charge = Stripe::Charge.create(
#     :amount => @amount * 100,
#     :currency => "usd",
#     :source => params[:stripeToken],
#     :description => "Test Charge"
#   )
  
#   flash[:notice] = "Successfully created a charge"
#   redirect_to root_path

#   rescue Stripe::CardError => e
#     flash[:error] = e.message
#     redirect_to new_charge_path
#   end
# end
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

 



  
  