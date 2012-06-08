module PagseguroV2
  class Address < Hashie::Dash
    property :street
    property :number
    property :complement
    property :district
    property :postal_code, :from => :postalCode
    property :city
    property :state
    property :country

  def to_xml(options = {})
    builder = options[:builder] || Builder::XmlMarkup.new()
      builder.address do |address|
        address.country country if country
        address.state state if state
        address.city city if city
        address.district district if district
        address.postalCode postal_code if postal_code
        address.street street if street
        address.number number if number
        address.complement complement if complement
      end
    end
  end
end
