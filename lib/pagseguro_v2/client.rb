require 'httparty'

module PagseguroV2
  class Client
    include HTTParty
    format :xml
    base_uri API_HOST

    API_HOST = "https://ws.pagseguro.uol.com.br/v2/"
    REDIRECT_URL = "https://pagseguro.uol.com.br/v2/checkout/payment.html?code="
    CHECKOUT_PATH = 'checkout'
    NOTIFICATION_PATH = 'transactions/notifications'

    attr_accessor :email
    attr_accessor :token

    def initialize(email, token)
      super()
      self.email = email
      self.token = token
    end

    def checkout(checkout)
      params = checkout.to_params
      header = {"Content-Type" => "application/xml; charset=UTF-8"}
      query = { :email => self.email, :token => self.token }
      options = {query: query, body: params, headers: header }
      response = self.class.post(CHECKOUT_PATH, options)
    end
   end
end
