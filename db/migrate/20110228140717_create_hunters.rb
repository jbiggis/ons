class CreateHunters < ActiveRecord::Migration
  def self.up
    create_table :hunters, :id => false do |t|
	t.integer :hunter_id, :limit => 8, :null => false
	t.string :first_name
	t.string :last_name	
	t.string :email
	t.string :gender
	t.date :DOB
      t.timestamps
    end
    add_index :hunters, :hunter_id, :unique => true
  end

  def self.down
    drop_table :hunters
  end
end
