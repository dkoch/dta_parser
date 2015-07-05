module DtaParser

  class FooterRecord < Record

    attr_accessor :bookings_count, :sum_bank_codes, :sum_account_nos, :sum_amounts

    def initialize(string)
      super
      self.bookings_count  = raw[10,  7].to_i
      self.sum_bank_codes  = raw[30, 17].to_i
      self.sum_account_nos = raw[47, 17].to_i
      self.sum_amounts     = raw[64, 13].to_f / 100
    end

  end

end
