class BiddingPeriod < ActiveRecord::Base
  belongs_to :item
  has_many :bidder_period_items, :dependent => :destroy
end
