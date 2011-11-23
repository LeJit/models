class RenameCols < ActiveRecord::Migration
  def self.up
	rename_column :items, :Name, :name
	rename_column :items, :category_id, :category_name
	rename_column :items, :SellerID, :seller_id
	rename_column :items, :BuyerID, :buyer_id
	rename_column :items, :PriceSet, :price_set
	rename_column :items, :PriceSold, :price_sold
	rename_column :items, :Status, :status
	rename_column :items, :Condition, :condition
  end

  def self.down
  end
end
