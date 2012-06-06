module PagseguroV2
  class Notification < Hashie::Dash
    property :code
    property :type

    def initialize(attributes)
      self.code = attributes.delete 'notificationCode'
      self.type = attributes.delete 'notificationType'
      super(attributes)
    end

    def to_hash
      hash = Hash.new
      hash.merge!({ 'notificationCode' => self.code }) if self.code
      hash.merge!({ 'notificationType' => self.type }) if self.type
      hash
    end
  end
end
