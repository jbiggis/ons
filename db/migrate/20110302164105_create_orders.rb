class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders, :id => false do |t|
      t.integer :order_id, :limit => 8, :null => false
      t.integer :hunter_id, :null => false
      t.integer :product_id, :null => false
      t.string :status
      t.string :message
      t.boolean :refund_funding_source
      t.string :refund_reason

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
