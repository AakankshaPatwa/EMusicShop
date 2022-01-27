# Rails.configuration.stripe = {
#   :publishable_key => ENV['PUBLISHABLE_KEY'],
#   :secret_key      => ENV['SECRET_KEY']
# }

Rails.configuration.stripe = { 
  :publishable_key => 'pk_test_51KLM1sSFDNiRd0TlTMPU9a3160W8AOW6LBUIzTVtXNr5drMa2jDg0lX1jXGTuwgVUatP74EH6Nw8vn6AptMCemrp00T6dJj7p8', 
  :secret_key => 'sk_test_51KLM1sSFDNiRd0Tld5MdiutK92ggcFJObpX2d1cMqPBtIdGGjRnUZulbroTfCkmDymVAzXkTKB6oXheOe7SRVKm100WAb6kHqJ'
}  

Stripe.api_key = Rails.configuration.stripe[:secret_key]