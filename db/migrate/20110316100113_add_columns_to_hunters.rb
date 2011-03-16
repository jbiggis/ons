class AddColumnsToHunters < ActiveRecord::Migration
  def self.up
    add_column :hunters, :last_login, :datetime
    add_column :hunters, :login_count, :integer, :default => 0, :null => false
  end

  def self.down
    remove_column :hunters, :login_count
    remove_column :hunters, :last_login
  end
end
