namespace :db do
  desc "Fill database with initial data"
  task :initialize => :environment do
    	create_products
 end
end

def create_products

	Product.create(:title => '5 Picks', :description => '5 Picks for 50 facebook credits', :price => 50, :credits_to_add => 5 )
	Product.create(:title => '10 Picks', :description => '15 Picks for 100 facebook credits - 33% off', :price => 100, :credits_to_add => 15 )
	

end
