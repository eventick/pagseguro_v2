module PagseguroV2
  class Item < Hashie::Dash
    property :id, required: true
    property :description, required: true
    property :amount, required: true
    property :quantity, required: true, default: 1
    property :shipping_cost, default: "0.00"
    property :weight, default: 0

    def to_xml(options = {})
      builder = options[:builder] || Builder::XmlMarkup.new()
      builder.item do |item|
        item.id id
        item.description description
        item.amount amount
        item.quantity quantity
        item.shippingCost shipping_cost.to_s 'F' if shipping_cost
        item.weight weight if weight
      end
    end

    def quantity
      self[:quantity].to_i
    end

    def weight
      self[:weight].to_i if self[:weight]
    end
  end
end
