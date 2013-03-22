require 'httparty'
require 'hashie'
require 'builder'
require 'bigdecimal'
require 'bigdecimal/util'
require "nokogiri"

require "pagseguro_v2/version"
require "pagseguro_v2/client"
require "pagseguro_v2/config"
require "pagseguro_v2/checkout"
require "pagseguro_v2/item"

require 'pagseguro_v2/address'

require "pagseguro_v2/sender"
require "pagseguro_v2/shipping"
require "pagseguro_v2/notification"
require "pagseguro_v2/inquiry"
require "pagseguro_v2/transaction"
require "pagseguro_v2/transaction/payment"

require "pagseguro_v2/errors/invalid_data"
require "pagseguro_v2/errors/unknown_error"
require "pagseguro_v2/errors/unauthorized"

# Error classes
#require "errors/unauthorized"

module PagseguroV2
  # Your code goes here...
end