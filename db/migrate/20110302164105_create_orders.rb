class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :hunter_id
      t.integer :product_id
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
