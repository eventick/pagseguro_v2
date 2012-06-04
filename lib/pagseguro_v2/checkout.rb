require 'pagseguro_v2/config'

module PagseguroV2
  class Checkout < Hashie::Dash
    attr_accessor :client

    # Data from the buyer
    property :sender
    # Shipping informations
    property :shipping

    # The currency in which payment will be made
    property :currency, :required => true, :default =>  PagseguroV2::Config::CURRENCY
    # List of items contained in the payment
    property :items, :required => true
    # Code that reference the payment
    property :reference
    # Determines the URL to which the buyer will be redirected after the end
    # of the payment stream
    property :redirect_url
    # Specifies an extra value to be added or subtracted from the total payment
    property :extra_amount
    # maximum number of times the code created by the Payment API calls can be used
    # Integer <= 0
    property :max_uses
    # Time (in seconds) during which the payment code created by
    # the Payment API call can be used.
    # Integer <= 30.
    property :max_age


    def initialize(options)
      self.item = options[:item] if options[:item]
      self.items = options[:items] if options[:items]
      options.delete(:items)
      options.delete(:item)
      super(options)
    end

    def item=(item)
      self.items = [item]
    end


    def proceed!
      # code_blank = self.code.nil? || self.code.empty?
      r_code = self.client.checkout(self) # if code_blank
      self.code = r_code
      self
    end

    def to_params()

    end

      private
      # melhorar
      def convert_unit(number, unit)
        number = (BigDecimal("#{number}") * unit).to_i unless number.nil? || number.kind_of?(Integer)
        number
      end
    end
end
