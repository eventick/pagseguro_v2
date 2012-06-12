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
      self.parse_post_response(PagseguroV2::Config::CHECKOUT_PATH, checkout)
    end

    def query_transaction(notification)
      path = PagseguroV2::Config::NOTIFICATION_PATH.gsub 'ID', notification.code
      options = { query: {email: email, token: token} }
      parse_get_response(path, options)
    end

    def parse_post_response(path, object)
      response = post(path, object)
      parse_response(response)
    end

    def parse_get_response(path, options)
      response = get(path, options)
      parse_response(response)
    end

    def parse_response(response)
      if response.code == 200
        response
      elsif response.code == 401
        raise PagseguroV2::Errors::Unauthorized
      elsif response.code == 400
        raise PagseguroV2::Errors::InvalidData.new(response.body)
      else
        raise PagseguroV2::Errors::UnknownError.new(response)
      end
    end

    def get(path, options = {})
      self.class.get(path, options)
    end

    def post(path, object)
      object_xml = object.to_xml
      header = {"Content-Type" => "application/xml; charset=UTF-8"}
      query = { :email => self.email, :token => self.token }
      options = {query: query, body: object_xml, headers: header}
      self.class.post(path, options)
    end
  end
end
