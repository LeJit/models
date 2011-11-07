class CreateBidderPeriodItems < ActiveRecord::Migration
  def self.up
    create_table :bidder_period_items do |t|
      t.integer :bidding_period_id
      t.integer :member_id
      t.integer :item_id
      t.integer :AmtBid

      t.timestamps
    end
  end

  def self.down
    drop_table :bidder_period_items
  end
end
