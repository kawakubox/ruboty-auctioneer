# frozen_string_literal: true

module Ruboty
  module Auctioneer
    module Actions
      class AuctionJoin < Ruboty::Actions::Base
        def call
          message.reply('POST /api/v1/users')
        end
      end
    end
  end
end
