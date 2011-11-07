class Item < ActiveRecord::Base
  belongs_to :member, :foreign_key => 'SellerID'
  belongs_to :member, :foreign_key => 'BuyerID'
  belongs_to :category
  has_many :bidding_periods, :dependent => :destroy
  has_many :bidder_period_items, :dependent => :destroy
end
