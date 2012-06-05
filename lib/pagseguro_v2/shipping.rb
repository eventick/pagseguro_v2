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
  end
end
