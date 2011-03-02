class AddCreditToHunters < ActiveRecord::Migration
  def self.up
    add_column :hunters, :credits, :integer, :default => 2, :null => false
  end

  def self.down
    remove_column :hunters, :credits
  end
end
