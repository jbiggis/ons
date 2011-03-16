class CreateTemptargets < ActiveRecord::Migration
  def self.up
    create_table :temptargets do |t|
	t.string :hunter_id, :null => false
	t.string :target_id, :null => false
    	t.string :name
	t.datetime :matched_at
	t.datetime :notified_at
      t.timestamps
    end
    add_index :temptargets, :hunter_id
    add_index :temptargets, [:hunter_id, :target_id], :unique => true
  end

  def self.down
    drop_table :temptargets
  end
end
