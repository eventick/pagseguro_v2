module PagseguroV2
  class Pagseguro
    attr_accessor :email
    attr_accessor :token

    def initialize(email, token)
      super()
      self.email = email
      self.token = token
    end
  end
end
