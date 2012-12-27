module PagseguroV2
  class Notification < Hashie::Trash
    property :code, :from => :notificationCode
    property :type, :from => :notificationType

    attr_accessor :client

    def transaction
      response = self.client.query_transaction(self)
      transaction = Transaction.new response['transaction']
      transaction
    end
  end
end