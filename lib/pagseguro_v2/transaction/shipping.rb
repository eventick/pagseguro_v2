# encoding: utf-8
module PagseguroV2
  module Transaction
    module Shipping
      TYPES = {
        normal: 1 ,
        express: 2,
        other: 3
      }

      TYPES_STRINGS = {
        normal: "Encomenda normal (PAC)",
        express: "SEDEX",
        other: "Tipo de frete não especificado"
      }
    end
  end
end

