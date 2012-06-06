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
        if phone_area_number && phone_number
          sender.phone do |phone|
              phone.areaCode
              phone.number
          end
        end
      end
    end
  end
end
