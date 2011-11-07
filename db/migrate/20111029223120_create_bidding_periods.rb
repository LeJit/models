class CreateBiddingPeriods < ActiveRecord::Migration
  def self.up
    create_table :bidding_periods do |t|
      t.date :StartDt
      t.date :EndDt
      t.integer :item_id
      t.integer :NumPeriods
      t.integer :Status
      t.integer :BiddingCap

      t.timestamps
    end
  end

  def self.down
    drop_table :bidding_periods
  end
end
