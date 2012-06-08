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

    def checkout(attributes)
      checkout = Checkout.new(attributes)
      checkout.client = self
      checkout
    end

    def notification(attributes)
      notification = Notification.new(attributes)
      notification.client = self
      notification
    end

    def proceed_checkout(checkout)
      response = self.post(
          PagseguroV2::Config::CHECKOUT_PATH,
          checkout
      )
      response
    end

    def query_transaction(notification)
      path = PagseguroV2::Config::NOTIFICATION_PATH.gsub 'ID', notification.code
      options = { query: {email: email, token: token} }
      response = self.get(path, options)
      response
    end

    def get(path, options = {})
      response = self.class.get(path, options)
    end

    def post(path, object)
      object_xml = object.to_xml
      header = {"Content-Type" => "application/xml; charset=UTF-8"}
      query = { :email => self.email, :token => self.token }
      options = {query: query, body: object_xml, headers: header}
      response = self.class.post(path, options)
      response
    end
  end
end
