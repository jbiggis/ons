class RenameAndDeleteColumnsInTargets < ActiveRecord::Migration
  def self.up
	rename_column :targets, :first_name, :name
	remove_column :targets, :last_name
  end

  def self.down
	rename_column :targets, :name, :first_name
	add_column :targets, :last_name, :string
  end
end
