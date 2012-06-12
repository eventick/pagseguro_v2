# encoding: utf-8

module PagseguroV2
  module Transaction
    module Payment
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

    #1	Aguardando pagamento: o comprador iniciou a transação, mas até o momento o PagSeguro não recebeu nenhuma informação sobre o pagamento.
    #2	Em análise: o comprador optou por pagar com um cartão de crédito e o PagSeguro está analisando o risco da transação.
    #3	Paga: a transação foi paga pelo comprador e o PagSeguro já recebeu uma confirmação da instituição financeira responsável pelo processamento.
    #4	Disponível: a transação foi paga e chegou ao final de seu prazo de liberação sem ter sido retornada e sem que haja nenhuma disputa aberta.
    #5	Em disputa: o comprador, dentro do prazo de liberação da transação, abriu uma disputa.
    #6	Devolvida: o valor da transação foi devolvido para o comprador.
    #7	Cancelada: a transação foi cancelada sem ter sido finalizada.
    end
  end
end
