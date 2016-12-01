# frozen_string_literal: true
require 'munson'
require 'faraday'
require 'ruboty/auctioneer/version'
require 'ruboty/auctioneer/resources'
require 'ruboty/handlers/auction'

module Ruboty
  module Auctioneer
    # Your code goes here...

    Munson.configure(
      url: 'http://localhost:3000/api/v1/',
      response_key_format: :dasherize)
  end
end
