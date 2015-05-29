Rails.configuration.stripe = {
    :publishable_key => ENV['PUBLISHABLE_KEY'],
    :secret_key      => ENV['SECRET_KEY']
    #For testing use the keys in clear format
    #:publishable_key => 'pk_test_kFoIvtHOjUcxcvdYiKYQgDKQ',
    #:secret_key => 'sk_test_fVNup5P0PQXvWlDIW6d5ac6i'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]