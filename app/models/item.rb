class Item < ActiveRecord::Base
  attr_accessible :name, :status, :condition, :price_set, :category_name, :seller_id, :buyer_id
  
  belongs_to :member, :foreign_key => 'seller_id'
  belongs_to :member, :foreign_key => 'buyer_id'
  belongs_to :category
  has_many :bidding_periods, :dependent => :destroy
  has_many :bidder_period_items, :dependent => :destroy	
  
  validates :name, :presence=>true, :length => { :maximum => 50}
  validates :condition, :presence=>true, :length => { :maximum => 15}
  validates :price_set, :presence=>true
  validates :category_name, :presence=>true
end
