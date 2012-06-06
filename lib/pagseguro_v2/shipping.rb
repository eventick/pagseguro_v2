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
    property :cost

  def to_xml(options = {})
    builder = options[:builder] || Builder::XmlMarkup.new()
      builder.shipping do |shipping|
        shipping.type type
        shipping.address do |address|
          address.country address_country if address_country
          address.state address_state if address_state
          address.city address_city if address_city
          address.district address_district if address_district
          address.street address_street if address_street
          address.number address_number if address_number
          address.complement address_complement if address_complement
        end
      end
    end

  end
end
