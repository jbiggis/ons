class AddColumnToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :credits_to_add, :integer
  end

  def self.down
    remove_column :products, :credits_to_add
  end
end
