class ChargesController < ApplicationController

  def new; end

  def create
    # Amount in cents
    @amount = 500
   # byebug
    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )
    user.update(stripe_token: customer.id)
    Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: customer.email,
      currency: 'usd'
    )
  end
end
