module PagseguroV2
  class Shipping < Hashie::Dash
    property :type, default: 3
    property :address
    property :cost

  def to_xml(options = {})
    builder = options[:builder] || Builder::XmlMarkup.new()
      builder.shipping do |shipping|
        shipping.type type
        if self.address
          shipping.address self.address.to_xml(:builder => shipping)
        end
      end
    end
  end
end