module PagseguroV2
  module Errors
    class Unauthorized < Exception
      def initialize
        super("Email and token provided has failed to authenticate")
      end
    end
  end
end
