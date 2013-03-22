module PagseguroV2
  module Config
    API_HOST = "https://ws.pagseguro.uol.com.br/v2"
    REDIRECT_URL = "https://pagseguro.uol.com.br/v2/checkout/payment.html?code="

    CHECKOUT_PATH = '/checkout'
    NOTIFICATION_PATH = '/transactions/notifications/ID'
    INQUIRY_PATH = '/transactions/ID'

    CHARSET = "UTF-8"
    CURRENCY = "BRL"
  end
end