class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :FirstName
      t.string :LastName
      t.string :Email
      t.string :Password

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
