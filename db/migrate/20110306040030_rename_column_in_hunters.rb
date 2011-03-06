class RenameColumnInHunters < ActiveRecord::Migration
  def self.up
	rename_column :hunters, :credits, :credits_left
	add_column :hunters, :total_credits, :integer
  end

  def self.down
	rename_column :hunters, :credits_left, :credits
	remove_column :hunters, :total_credits
  end
end
