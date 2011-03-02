class AddColumnsToTargets < ActiveRecord::Migration
  def self.up
    add_column :targets, :first_name, :string
    add_column :targets, :last_name, :string
  end

  def self.down
    remove_column :targets, :last_name
    remove_column :targets, :first_name
  end
end
