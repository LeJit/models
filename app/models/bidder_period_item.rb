class BidderPeriodItem < ActiveRecord::Base
  belongs_to :bidding_period
  belongs_to :member
  belongs_to :item
end
