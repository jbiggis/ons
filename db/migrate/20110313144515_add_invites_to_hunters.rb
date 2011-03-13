class AddInvitesToHunters < ActiveRecord::Migration
  def self.up
	add_column :hunters, :invites, :integer, :default => 5, :null => false
  end

  def self.down
	remove_column :hunters, :invites
  end
end
