class AddRevealsToHunters < ActiveRecord::Migration
  def self.up
	add_column :hunters, :reveals, :integer, :default => 0, :null => false
  end

  def self.down
	remove_column :hunters, :reveals
  end
end
