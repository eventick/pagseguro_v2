require "pagseguro_v2/version"
require "pagseguro_v2/client"
require "pagseguro_v2/checkout"
require "pagseguro_v2/models/item"
require "pagseguro_v2/models/sender"
require "pagseguro_v2/models/shipping"

module PagseguroV2
  CHARSET = "UTF-8"
  CURRENCY = "BRL"

  API_HOST = "https://ws.pagseguro.uol.com.br/v2/"
  REDIRECT_URL = "https://pagseguro.uol.com.br/v2/checkout/payment.html?code="
  CHECKOUT_PATH = 'checkout'
  NOTIFICATION_PATH = 'transactions/notifications'

  # Your code goes here...
end
