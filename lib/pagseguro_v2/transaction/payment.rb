# encoding: utf-8

module PagseguroV2
  module Pay
    class Payment
      CODES = {
      101	=> "Cartão de crédito Visa",
      102	=> "Cartão de crédito MasterCard",
      103	=> "Cartão de crédito American Express",
      104	=> "Cartão de crédito Diners",
      105	=> "Cartão de crédito Hipercard",
      106	=> "Cartão de crédito Aura",
      107	=> "Cartão de crédito Elo",
      108	=> 'Cartão de crédito PLENOCard',
      109	=> 'Cartão de crédito PersonalCard',
      110	=> 'Cartão de crédito JCB',
      111	=> 'Cartão de crédito Discover',
      112	=> 'Cartão de crédito BrasilCard',
      113	=> 'Cartão de crédito FORTBRASIL',
      201	=> "Boleto Bradesco",
      202	=> "Boleto Santander",
      301	=> "Débito online Bradesco",
      302	=> "Débito online Itaú",
      303	=> "Débito online Unibanco",
      304	=> "Débito online Banco do Brasil",
      305	=> "Débito online Banco Real",
      306	=> "Débito online Banrisul",
      307	=> 'Débito online HSBC',
      401	=> "Saldo PagSeguro",
      501	=> "Oi Paggo"
      }

      TYPES = {
        1 => :credit_card,
        2 => :invoice,
        3 => :online_transfer,
        4 => :pagseguro,
        5 => :oi_paggo
      }

      TYPES_STRINGS = {
        credit_card: 'Cartão de crédito',
        invoice: 'Boleto',
        online_transfer: 'Débito online (TEF)',
        pagseguro: 'Saldo PagSeguro',
        oi_paggo: 'Oi Paggo',
      }

      STATUS = {
        1 => :pending,
        2 => :verifying,
        3 => :approved,
        4 => :completed,
        5 => :completed,
        6 => :dispute,
        7 => :canceled
      }

    end
  end
end
