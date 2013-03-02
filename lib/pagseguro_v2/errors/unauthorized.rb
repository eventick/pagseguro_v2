module PagseguroV2
  module Errors
    class Unauthorized < Exception
      def initialize
        super("Email and token provided have failed to authenticate")
      end
    end
  end
end