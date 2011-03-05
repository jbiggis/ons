class AddAccessTokenToHunters < ActiveRecord::Migration
  def self.up
	add_column :hunters, :access_token, :string
  end

  def self.down
	remove_column :hunters, :access_token
  end
end
