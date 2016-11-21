module Ruboty
  module Auctioneer
    class Auction < Munson::Resource
      self.type = :auctions
      has_one :exhibitor
      has_many :bids

      key_type :integer
      attribute :title, :string

      def info
        "商品名 : #{self.title}\n出品者 : #{self.exhibitor.name}"
      end
    end

    class User < Munson::Resource
      self.type = :users

      key_type :integer
      attribute :slack_id, :string
      attribute :name, :string
    end

    class Bid < Munson::Resource
      self.type = :bids

      has_one :auction
      has_one :bidder

      key_type :integer

      attribute :bidded_at, :time
      attribute :amount, :integer

      def info
        "入札日時 : #{bidded_at}\n入札者 : #{bidder.name}\n入札金額 : #{amount}"
      end
    end
  end
end
