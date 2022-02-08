Rails.configuration.stripe = {
  :publishable_key => ENV['stripe_publishable_key'],
  :secret_key      => ENV['stripe_api_key']
}

Stripe.api_key = ENV['stripe_api_key']


# Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Stripe.api_key = Rails.application.credentials[:stripe][:secret]


# # byebug
# if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
#   Stripe.api_key = Rails.application.credentials[:stripe][:secret]
# end