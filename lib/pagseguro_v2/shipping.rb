module PagseguroV2
  class Shipping < Hashie::Dash
    property :type, default: 3
    property :address_country
    property :address_state
    property :address_city
    property :address_district
    property :address_street
    property :address_number
    property :address_complement
  end
end
