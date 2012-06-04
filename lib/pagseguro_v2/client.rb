require 'httparty'
require 'pagseguro_v2/config'

module PagseguroV2
  class Client
    include HTTParty

    base_uri PagseguroV2::Config::API_HOST
    format :xml

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
      response = self.class.post(PagseguroV2::Config::CHECKOUT_PATH, options)
    end
   end
end
