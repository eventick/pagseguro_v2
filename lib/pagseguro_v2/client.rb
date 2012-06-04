module PagseguroV2
  class Client
    include HTTParty
    format :xml
    base_uri PagseguroV2::API_HOST

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
      options = {body: params, headers: header }
      response = self.class.post(PagseguroV2::CHECKOUT_PATH, options)
    end
   end
end
