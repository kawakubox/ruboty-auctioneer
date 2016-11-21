# frozen_string_literal: true
module Ruboty
  module Handlers
    class Auction < Base
      on /list\z/, name: 'list', description: '開催中のオークション一覧'

      def list(message)
        auctions = Ruboty::Auctioneer::Auction.include(:exhibitor).fetch

        message.reply(auctions.map(&:info).join("\n").dup)
      end

      on /bid (?<auction_id>.*?) (?<amount>.*?)\z/, name: 'bid', description: 'オークションへの入札'

      def bid(message)
        auction_id = message[:auction_id]
        amount = message[:amount]
        message.reply("オークションNo.#{auction_id}に#{amount}円で入札します".dup)
      end

      on /sell (?<title>.*?) (?<price>.*?)\z/, name: 'sell', description: 'オークションを開催する'

      def sell(message)
        title = message[:title].gsub('"', '')
        price = message[:price]
        exhibitor = message.from_name
        message.reply("オークションを開催します\n```\n#{title}\n出品者 : #{exhibitor}\n開始価格 : #{price}円\n```".dup)
      end

      on /fin (?<auction_id>.*?)\z/, name: 'finish', description: 'オークションを終了する'

      def finish(message)
        auction_id = message[:auction_id]
        message.reply("オークションNo.#{auction_id}を終了します".dup)
      end

      on /history (?<auction_id>.*?)\z/, name: 'history', description: 'オークションの入札履歴を表示する'

      def history(message)
        auction_id = message[:auction_id]
        Ruboty::Auctioneer::Bid.munson.path = "/api/v1/auctions/#{auction_id}/bids"
        bids = Ruboty::Auctioneer::Bid.include(:bidder).fetch

        message.reply(bids.map(&:info).join("\n").dup)
      end
    end
  end
end
