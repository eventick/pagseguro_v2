module PagseguroV2
  class Sender < Hashie::Dash
    property :email
    property :name
    property :phone_areaCode
    property :phone_number
  end
end
