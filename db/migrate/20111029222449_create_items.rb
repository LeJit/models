class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :Name
      t.string :category_id
      t.integer :SellerID
      t.integer :Status
      t.string :Condition
      t.integer :BuyerID
      t.integer :PriceSet
      t.integer :PriceSold

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
