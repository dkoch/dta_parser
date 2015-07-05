require "spec_helper"

describe DtaParser::File do

  it "parses the passed file and provides the information in objects" do
    file = DtaParser::File.new("spec/fixtures/sample.dta")

    record = file.header_record
    expect(record).to be_instance_of DtaParser::HeaderRecord

    expect(record.type              ).to eq "LK"
    expect(record.receiver_bank_code).to eq "70022200"
    expect(record.sender_bank_code  ).to eq "00000000"
    expect(record.sender_name       ).to eq "FIDOR BANK"
    expect(record.date              ).to eq Date.new(2015, 7, 5)
    expect(record.sender_account_no ).to eq "0123456789"
    expect(record.reference         ).to eq "0000000000"
    expect(record.currency          ).to eq 1

    record = file.booking_records.shift
    expect(record).to be_instance_of DtaParser::BookingRecord

    expect(record.receiver_bank_code  ).to eq "70080000"
    expect(record.receiver_account_no ).to eq "0987654321"
    expect(record.internal_customer_no).to eq "0000000000000"
    expect(record.code                ).to eq "05"
    expect(record.code_extension      ).to eq "000"
    expect(record.sender_bank_code    ).to eq "70022200"
    expect(record.sender_account_no   ).to eq "0123456789"
    expect(record.amount              ).to eq 42.23
    expect(record.receiver_name       ).to eq "RECEIVER NAME"
    expect(record.sender_name         ).to eq "FIDOR BANK"
    expect(record.subject             ).to eq "THE SUBJECT"
    expect(record.currency            ).to eq 1
    expect(record.extensions_count    ).to eq 0

    record = file.booking_records.shift
    expect(record).to be_instance_of DtaParser::BookingRecord

    record = file.booking_records.shift
    expect(record).to be_instance_of DtaParser::BookingRecord

    record = file.footer_record
    expect(record).to be_instance_of DtaParser::FooterRecord
    expect(record.bookings_count ).to eq 3
    expect(record.sum_bank_codes ).to eq 420306600
    expect(record.sum_account_nos).to eq 3333333330
    expect(record.sum_amounts    ).to eq 126.69
  end

end
