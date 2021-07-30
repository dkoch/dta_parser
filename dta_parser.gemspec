# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dta_parser/version'

Gem::Specification.new do |spec|
  spec.name          = "dta_parser"
  spec.version       = DtaParser::VERSION
  spec.authors       = ["Klaus Meyer"]
  spec.email         = ["spam@klaus-meyer.net"]

  spec.summary       = "Parse content from DTA files"
  spec.description   = "DTA is a fileformat used by e.g. german banks to transmit payment informations. " +
                       "It has been replaced by SEPA nowadays but is still used at some places."
  spec.homepage      = "https://github.com/klausmeyer/dta_parser"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "terminal-table", ">= 1.5"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
end
