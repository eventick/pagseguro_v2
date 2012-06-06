module PagseguroV2
  class Item < Hashie::Dash
    # Identify the items being paid. You can choose codes that are meaningful to your system and inform.
    property :id, required: true
    # Description of the items being paid.
    # Livre, com limite de 100 caracteres.
    property :description, required: true
    # Unit values of the items
    # Decimal, com duas casas decimais separadas por ponto (p.e., 1234.56).
    property :amount, required: true
    # Quantity of the items
    # Um número inteiro maior ou igual a 1 e menor ou igual a 999.
    property :quantity, required: true, default: 1
    # Shipping cost of unitary item
    property :shipping_cost, default: "0.00"
    # Weight of unitary item
    property :weight, default: 0

    def to_xml(options = {})
      builder = options[:builder] || Builder::XmlMarkup.new()
      builder.item do |item|
        item.id id
        item.description description
        item.amount amount
        item.quantity quantity
        item.shippingCost shipping_cost if shipping_cost
        item.weight weight if weight
      end
    end
  end
end
