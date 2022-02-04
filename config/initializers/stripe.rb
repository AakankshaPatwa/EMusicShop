# byebug
# Rails.configuration.stripe = {
#   :publishable_key => ENV['PUBLISHABLE_KEY'],
#   :secret_key      => ENV['SECRET_KEY']
# }

#Stripe.api_key = Rails.configuration.stripe[:secret_key]
# Stripe.api_key = Rails.application.credentials[:stripe][:secret]


# byebug
if Rails.application.credentials[:stripe].present? && Rails.application.credentials[:stripe][:secret].present?
  Stripe.api_key = Rails.application.credentials[:stripe][:secret]
end