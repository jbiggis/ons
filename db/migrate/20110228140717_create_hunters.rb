class CreateHunters < ActiveRecord::Migration
  def self.up
    create_table :hunters, :id => false do |t|
	t.string :hunter_id, :null => false
	t.string :first_name
	t.string :last_name	
	t.string :email
	t.string :gender
	t.date :DOB
	t.integer :credits_left, :default => 2, :null => false
	t.integer :total_credits, :default => 2, :null => false
	t.string :access_token
      t.timestamps
    end
    add_index :hunters, :hunter_id, :unique => true
  end

  def self.down
    drop_table :hunters
  end
end
