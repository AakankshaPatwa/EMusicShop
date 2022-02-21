
Rails.configuration.stripe = {
  pulishable_key: ENV['stripe_publishable_key'],
  secret_key: ENV['stripe_api_key']
}

Stripe.api_key = ENV['stripe_api_key']




# if Rails.env == 'production'
#   Rails.configuration.stripe = {
#     :publishable_key => 'pk_test_51KTAARSDfaiNSpeyif6vPj5cHleJDw3cSNHv0or3v7sXOlTf1zsvQS3MkSpi8xHcGWmICBEBclDYbBYVZInNsr9s00Wxs83aIE',
#     :secret_key      => 'sk_test_51KTAARSDfaiNSpeygOoX4706udO9gdN4uuBnd91IAU8Hxwsgrb2rreKX2BiT0HrbfYdrQezpzXhJHi9dKrO4gIRR00EWuS13z6'
#   }
# else
#   Rails.configuration.stripe = {
#     :publishable_key => 'pk_test_51KTAARSDfaiNSpeyif6vPj5cHleJDw3cSNHv0or3v7sXOlTf1zsvQS3MkSpi8xHcGWmICBEBclDYbBYVZInNsr9s00Wxs83aIE',
#     :secret_key      => 'sk_test_51KTAARSDfaiNSpeygOoX4706udO9gdN4uuBnd91IAU8Hxwsgrb2rreKX2BiT0HrbfYdrQezpzXhJHi9dKrO4gIRR00EWuS13z6'
#   }
# end

# Stripe.api_key = Rails.configuration.stripe[:secret_key]

# Stripe.api_key = 'sk_test_51KRSa9SBsGsaYp6jO2uiNA4cKdShYR7CEUKPrvmp48SkWwcpz9Y9T169ouwYkIkQKI9SBVTxWv4gU0qbSLUYGSdh00ISn7JTz2'