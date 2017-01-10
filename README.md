# DtaParser

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/dta_parser`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dta_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dta_parser

## Usage

Simply pass a filename to parse and use the provided data objects to receive the parsed data.

### Example

```ruby
require "yaml"
file = DtaParser::File.new("path/to/my-bookings.dta")

puts file.header_record.to_yaml
# => --- !ruby/object:DtaParser::HeaderRecord
# raw: 0128ALK7002220000000000FIDOR BANK                 050715    01234567890000000000               24062013                        1
# type: LK
# receiver_bank_code: '70022200'
# sender_bank_code: '00000000'
# sender_name: FIDOR BANK
# date: 2015-07-05
# sender_account_no: 0123456789
# reference: '0000000000'
# currency: 1

puts file.booking_records.first.to_yaml
# --- !ruby/object:DtaParser::BookingRecord
# raw: 0187C00000000700800000987654321000000000000005000 0000000000070022200012345678900000004223   THE
#   SUBJECT LINE                                    FIDOR BANKTHE SUBJECT                1  00
# receiver_bank_code: '70080000'
# receiver_account_no: 0987654321
# internal_customer_no: '0000000000000'
# code: '05'
# code_extension: '000'
# sender_bank_code: '70022200'
# amount: 42.23
# receiver_name: RECEIVER NAME
# sender_name: FIDOR BANK
# subject: THE SUBJECT
# currency: 1
# extensions_count: 0
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/klausmeyer/dta_parser.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

