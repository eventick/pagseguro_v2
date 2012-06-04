module PagseguroV2
    class Item
        # Identify the items being paid. You can choose codes that are meaningful to your system and inform.
        attr_accessor :id

        # Description of the items being paid.
        # Livre, com limite de 100 caracteres.
        attr_accessor :description

        # Unit values of the items
        # Decimal, com duas casas decimais separadas por ponto (p.e., 1234.56).
        attr_accessor :amount

        # Quantity of the items
        # Um número inteiro maior ou igual a 1 e menor ou igual a 999.
        attr_accessor :quantity

        # Shipping cost of unitary item
        attr_accessor :shippingCost

        # Weight of unitary item
        attr_accessor :weight

        def initialize(id, description, amount, quantity=1)
          self.id = reference
          self.description = description
          self.amount = amount
          self.quantity = quantity
          self.shippingCost = "0.00"
          self.weight = 0
        end

        def item=(item)
         self.items = [item]
       end
      end
end
