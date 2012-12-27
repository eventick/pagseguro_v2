module PagseguroV2
  class Transaction  < Hashie::Trash
    property :date
    property :code
    property :reference
    property :type
    property :status
    property :status_code

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
    property :last_event_date, :from => :lastEventDate
    property :escrow_end_date, :from => :escrowEndDate
    property :cancellation_source, :from => :cancellationSource

    def initialize(options)
      translate_status(options)
      super(options)
    end

    def translate_status(options)
      status_code = options["status"]
      options["status"] = Codes::Payment::STATUS[status_code.to_i]
      options["status_code"] = status_code
    end
  end
end
