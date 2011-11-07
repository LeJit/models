class CreateBankAccts < ActiveRecord::Migration
  def self.up
    create_table :bank_accts do |t|
      t.integer :AcctNum
      t.integer :member_id
      t.integer :Amt

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_accts
  end
end
