module DtaParser

  class BookingRecord < Record

    attr_accessor :receiver_bank_code, :receiver_account_no, :internal_customer_no, :code, :code_extension, :sender_bank_code, :sender_account_no, :amount, :receiver_name, :sender_name, :subject, :currency, :extensions_count

    def initialize(string)
      super
      self.receiver_bank_code   = raw[13,   8]
      self.receiver_account_no  = raw[21,  10]
      self.internal_customer_no = raw[31,  13]
      self.code                 = raw[44,   2]
      self.code_extension       = raw[46,   3]
      self.sender_bank_code     = raw[61,   8]
      self.sender_account_no    = raw[69,  10]
      self.amount               = raw[79,  11].to_f / 100
      self.receiver_name        = raw[93,  27].strip
      self.sender_name          = raw[128, 27].strip
      self.subject              = raw[155, 27].strip
      self.currency             = raw[182,  1].to_i
      self.extensions_count     = raw[185,  2].to_i
    end

  end

end
