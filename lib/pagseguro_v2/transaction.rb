module PagseguroV2
  class Transaction  < Hashie::Dash
    property :status
    property :type
    property :reference
    property :code
    property :date

    property :lastEventDate
    property :grossAmount
    property :discountAmount
    property :feeAmount
    property :netAmount
    property :extraAmount
    property :installmentCount

    property :itemCount
    property :items
    property :sender
    property :shipping
  end
end
