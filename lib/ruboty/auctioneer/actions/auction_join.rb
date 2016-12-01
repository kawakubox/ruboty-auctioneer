# frozen_string_literal: true

module Ruboty
  module Auctioneer
    module Actions
      class AuctionJoin < Ruboty::Actions::Base
        def call
          conn = Faraday.new(url: 'http://localhost:3000')
          res = conn.post '/api/v1/users.json', id: message.from, name: message.from_name
          msg = case res.status
                when 200
                  res.body
                else
                  res.body
          end
          message.reply(msg)
        end
      end
    end
  end
end
