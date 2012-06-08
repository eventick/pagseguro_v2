module PagseguroV2
  class Transaction  < Hashie::Trash
    property :status
    property :type
    property :reference
    property :code
    property :date
    property :payment_method

    property :last_eventDate, :from => :lastEventDate
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

    def initialize(options)
      self.payment_method = PaymentMethod.new(options[:paymentMethod]) if options[:paymentMethod]
      #self.sender = Sender.new(options[:sender]) if options[:sender]
      self.shipping = Shipping.new(options[:shipping]) if options[:shipping]
      self.items = options[:items] if options[:items]
      options.delete(:payment_method)
     # options.delete(:sender)
      options.delete(:shipping)
      options.delete(:items)
      super(options)
    end

    def sender=(sender)
      self[:sender] = Sender.new(sender) if sender.is_a? Hash
      self[:sender] = sender if sender.is_a? Sender
    end

    def items=(items)
      items = items.map{ |i| Item.new(i) } if items.is_a? Array
      items = [Item.new(items)] if items.is_a? Hash
      self[:items] = items
    end

  end
end
