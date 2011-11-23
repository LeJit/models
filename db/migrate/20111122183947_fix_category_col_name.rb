class FixCategoryColName < ActiveRecord::Migration
  def self.up
	rename_column :categories, :Name, :name
  end

  def self.down
  end
end
