require 'pagseguro_v2/config'

module PagseguroV2
  class Checkout
    attr_accessor :client

    # The currency in which payment will be made
    attr_accessor :currency

    # List of items contained in the payment
    attr_accessor :items

        # Code that reference the payment
        attr_reader :reference

        # Data from the buyer
        attr_accessor :sender

        # Shipping informations
        attr_accessor :shipping

        # Specifies an extra value to be added or subtracted from the total payment
        attr_accessor :extra_amount

        # Determines the URL to which the buyer will be redirected after the end
        # of the payment stream
        attr_accessor :redirect_URL

        # Determines the maximum number of times the code created by the Payment API
        # call can be used
        # Integer <= 0.
        attr_accessor :max_uses

        # Determines the time (in seconds) during which the payment code created by
        # the Payment API call can be used.
        # Integer <= 30.
        attr_accessor :max_age

        def initialize(options)
          super()
          self.currency = PagseguroV2::Config::CURRENCY
          @reference = option[:reference]
          self.items = []
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
