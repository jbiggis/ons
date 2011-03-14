class RenameRevealsToKeysInHunters < ActiveRecord::Migration
  def self.up
		rename_column :hunters, :reveals, :keys
  end

  def self.down
		rename_column :hunters, :keys, :reveals
  end
end
