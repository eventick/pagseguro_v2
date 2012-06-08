module PagseguroV2
  class Transaction  < Hashie::Trash
    property :date
    property :code
    property :reference
    property :type
    property :status

    property :payment_method, :from => :paymentMethod

    property :gross_amount, :from => :grossAmount
    property :discount_amount, :from => :discountAmount
    property :fee_amount, :from => :feeAmount
    property :net_amount, :from => :netAmount
    property :extra_amount, :from => :extraAmount
    property :installment_count, :from => :installmentCount

    property :item_count, :from => :itemCount
    property :items
    property :sender
    property :shipping
  end
end
