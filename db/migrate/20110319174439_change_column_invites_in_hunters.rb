class ChangeColumnInvitesInHunters < ActiveRecord::Migration
  def self.up
		remove_column :hunters, :invites
		add_column :hunters, :invites_sent, :integer, :default => 0, :null => false
  end

  def self.down
		add_column :hunters, :invites, :integer, :default => 7, :null => false
		remove_column :hunters, :invites_sent
  end
end
