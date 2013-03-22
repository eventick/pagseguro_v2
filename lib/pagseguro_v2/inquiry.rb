module PagseguroV2
  class Inquiry < Hashie::Trash
    property :transaction_id

    attr_accessor :client

    def transaction
      response = self.client.inquiry_transaction(self)
      transaction = Transaction.new response['transaction']
      transaction
    end
  end
end