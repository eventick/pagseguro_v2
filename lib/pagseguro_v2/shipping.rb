module PagseguroV2
  class Shipping < Hashie::Dash
    TYPE_PAC = 1
    TYPE_SEDEX = 2
    TYPE_NA = 3

    property :type, default: TYPE_NA
    property :address_country
    property :address_state
    property :address_city
    property :address_district
    property :address_street
    property :address_number
    property :address_complement

    def to_xml(options = {})
      builder = options[:builder] || Builder::XmlMarkup.new()
      builder.shipping do |shipping|
        shipping.type type
        shipping.address_country address_country if address_country
        shipping.address_state address_state if address_state
        shipping.address_city address_city if address_city
        shipping.address_district address_district if address_district
        shipping.address_street address_street if address_street
        shipping.address_number address_number if address_number
        shipping.address_complement address_complement if address_complement
      end
    end

  end
end
