namespace :db do
  desc "Fill database with initial data"
  task :initialize => :environment do
    	create_products
 	end

	desc "Drop products"
  task :dropper => :environment do
    	dropper
 	end

end



def create_products

ActiveRecord::Migration.create_table :products do |t|
      t.string :title
      t.text :description
 			t.integer :price
			t.integer :keys_to_add
			
      t.timestamps
end


	Product.create(:title => '1 Key', :description => 'Purchase 1 Key for 50 facebook credits', :price => 50, :keys_to_add => 1 )
	Product.create(:title => '5 Keys', :description => 'Purchase 3 Keys and Get 2 FREE for 150 facebook credits', :price => 150, :keys_to_add => 5 )

end


def dropper
  ActiveRecord::Migration.drop_table "products"

end
