module DtaParser

  class HeaderRecord < Record

    attr_accessor :type, :receiver_bank_code, :sender_bank_code, :sender_name, :date, :sender_account_no, :reference, :currency

    def initialize(string)
      super
      self.type               = raw[  5,  2]
      self.receiver_bank_code = raw[  7,  8]
      self.sender_bank_code   = raw[ 15,  8]
      self.sender_name        = raw[ 23, 27].strip
      self.date               = date_from_string raw[50, 6]
      self.sender_account_no  = raw[ 60, 10]
      self.reference          = raw[ 70, 10]
      self.currency           = raw[127,  1].to_i
    end

    private

    def date_from_string(string)
      dd, mm, yy = string.scan(/../).map(&:to_i)
      Date.new(yy + 2000, mm, dd)
    end

  end

end
