module DtaParser
  class Record
    attr_accessor :raw

    def initialize(string)
      self.raw = string
    end
  end
end
