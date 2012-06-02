module PagSeguroV2
  module Models
    class Shipping
      # 1 Encomenda normal (PAC).
      # 2 SEDEX
      # 3  Tipo de frete não especificado.
      attr_accessor  :type,
          :address_country,
          :address_state,
          :address_city,
          :address_district,
          :address_street,
          :address_number,
          :address_complement
    end
  end
end
