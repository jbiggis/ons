class RemoveCreditsInHunter < ActiveRecord::Migration
  def self.up
	remove_column :hunters, :credits_left
	remove_column :hunters, :total_credits
  end

  def self.down
	add_column :hunters, :total_credits, :integer
	add_column :hunters, :credits_left, :integer
  end
end
