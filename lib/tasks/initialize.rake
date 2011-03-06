namespace :db do
  desc "Fill database with initial data"
  task :initialize => :environment do
    	create_products
 end
end

def create_products

	Product.create(:title => '5', :description => 'Get 5 for 5 facebook credits', :price => 5, :credits_to_add => 5 )
	Product.create(:title => '15', :description => 'Get 15 for 10 facebook credits - 30% off!', :price => 10, :credits_to_add => 10 )
	Product.create(:title => '30', :description => 'Get 30 for 15 facebook credits - 50% off!', :price => 15, :credits_to_add => 15 )

end
