module PagseguroV2
  class Sender < Hashie::Dash
    property :email
    property :name
    property :phone_area_code
    property :phone_number

    def to_xml(options = {})
      builder = options[:builder] || Builder::XmlMarkup.new()
      builder.sender do |sender|
        sender.email email if email
        sender.name name if name
        sender.phone_areaCode phone_area_code if phone_area_code
        sender.phone_number phone_number if phone_number
      end
    end
  end
end
