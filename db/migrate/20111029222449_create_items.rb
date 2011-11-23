class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.string :category_name
      t.integer :seller_id
      t.integer :status
      t.string :condition
      t.integer :buyer_id
      t.integer :price_set
      t.integer :price_sold

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
