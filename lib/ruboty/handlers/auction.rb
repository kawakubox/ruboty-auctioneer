# frozen_string_literal: true
module Ruboty
  module Handlers
    class Auction < Base
      on /list\z/, name: 'list', description: '開催中のオークション一覧'

      def list(message)
        message.reply('TODO : 開催中のオークション一覧を返す')
      end
    end
  end
end
