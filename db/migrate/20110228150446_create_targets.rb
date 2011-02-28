class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets, :id => false do |t|
	t.integer :hunter_id, :limit => 8, :null => false
	t.integer :target_id, :limit => 8, :null => false
	t.datetime :matched_at
	t.datetime :notified_at
      t.timestamps
    end
    add_index :targets, :hunter_id, :unique => true
  end

  def self.down
    drop_table :targets
  end
end
