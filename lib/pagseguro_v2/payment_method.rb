module PagseguroV2
  class PaymentMethod < Hashie::Dash
    property :type
    property :code

    def type
      Transaction::Payment::Codes[self.type]
    end

    def code
      Transaction::Payment::Codes[self.code]
    end
  end
end
