class RenameColumnInProducts < ActiveRecord::Migration
  def self.up
	rename_column :products, :credits_to_add, :reveals_to_add
  end

  def self.down
	rename_column :products, :reveals_to_add, :credits_to_add
  end
end
