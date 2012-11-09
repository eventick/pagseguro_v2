module PagseguroV2
  class PaymentMethod < Hashie::Dash
    property :type
    property :code
  end
end