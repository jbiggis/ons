class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :id => false do |t|
      t.string :order_id, :null => false
      t.string :hunter_id, :null => false
      t.string :product_id, :null => false
      t.string :status
      t.string :message
      t.boolean :refund_funding_source
      t.string :refund_reason

      t.timestamps
    end

    add_index :orders, :order_id, :unique => true
    add_index :orders, :product_id, :unique => true
	
  end

  def self.down
    drop_table :orders
  end
end
