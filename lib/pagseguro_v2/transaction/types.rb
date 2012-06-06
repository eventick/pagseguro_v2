module PagseguroV2
  module Transaction
    module Types
      TYPES = {
        payment: 1,
		transfer: 2,
		fund_addition: 3,
		withdraw: 4,
		charge: 5,
		donation: 6,
		bonus: 7,
		bonus_repass: 8,
		operational: 9,
		political_donation: 10
      }

      TYPES_STRINGS = {
        payment: 'Pagamento',
		transfer: 'Tranferencia',
      }
    end
  end
end
