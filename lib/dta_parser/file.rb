module DtaParser

  class File

    attr_accessor :raw, :header_record, :booking_records, :footer_record

    def initialize(filename)
      self.raw = ::File.open(filename, "r") { |f| f.read }
      self.booking_records ||= []

      records.each do |record|
        record_type = record[4, 1]
        case record_type
        when "A"
          self.header_record = DtaParser::HeaderRecord.new(record)
        when "C"
          self.booking_records << DtaParser::BookingRecord.new(record)
        when "E"
          self.footer_record = DtaParser::FooterRecord.new(record)
        else
          raise "Unknown record type: #{record_type}"
        end
      end
    end

    private

    def records
      [].tap do |records|
        offset  = 0
        while true
          offset = index = raw.index(/[0-9]{4}(A|C|E)/, offset)
          break unless index
          length = raw[index, 4].to_i
          records << raw[offset, length]
          offset = offset + length
        end
      end
    end
  end

end
