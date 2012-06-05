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

    def items=(items)
      items = items.map{ |i| Item.new(i) } if items.is_a? Array
      items = [Item.new(items)] if items.is_a? Hash
      self[:items] = items
    end

    def item=(item)
      self.items = [item]
    end

    def sender=(sender)
      self[:sender] = Sender.new(sender) if sender.is_a? Hash
      self[:sender] = sender if sender.is_a? Sender
    end

    def shipping=(shipping)
      self[:shipping] = Shipping.new(shipping) if shipping.is_a? Hash
      self[:shipping] = shipping if shipping.is_a? Shipping
    end

    def proceed!
      # code_blank = self.code.nil? || self.code.empty?
      r_code = self.client.checkout(self) # if code_blank
      self.code = r_code
      self
    end

    def to_hash(options = {})
      sender = self.delete "sender"
      shipping = self.delete "shipping"
      items = self.delete "items"

      self[:sender] = sender.to_hash(options) unless sender.nil?
      self[:shipping] = shipping.to_hash(options) unless shipping.nil?
      self[:items] = items.map { |i| i.to_hash(options) }

      hash = super(options)

      self[:sender] = sender unless sender.nil?
      self[:shipping] = shipping unless shipping.nil?
      self[:items] = items

      return hash
    end

      private
      # melhorar
      def convert_unit(number, unit)
        number = (BigDecimal("#{number}") * unit).to_i unless number.nil? || number.kind_of?(Integer)
        number
      end
    end
end
