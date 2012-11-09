module PagseguroV2
  module Errors
    class InvalidData < Exception
      def initialize(error_xml)
        err_msg = Nokogiri::XML(error_xml).css("errors error").inject("") do |acc, node|
          acc + "#{node.css('code').first.content}: #{node.css('message').first.content}\n"
        end
        super(err_msg)
      end
    end
  end
end