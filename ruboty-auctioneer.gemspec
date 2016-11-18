# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruboty/auctioneer/version'

Gem::Specification.new do |spec|
  spec.name          = 'ruboty-auctioneer'
  spec.version       = Ruboty::Auctioneer::VERSION
  spec.authors       = ['kawakubox']
  spec.email         = ['shigefumi.kawakubo@gmail.com']

  spec.summary       = 'Simple Auction chatops client.'
  spec.description   = 'This is ruboty plugin for simple auction chatops client.'
  spec.homepage      = "https://github.com/kawakubox/ruboty-auctioneer"
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'ruboty'

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
