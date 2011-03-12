namespace :db do
  desc "Fill database with initial data"
  task :initialize => :environment do
    	create_products
 end
end

def create_products

	Product.create(:title => '1 Reveal', :description => 'Buy 1 Reveal for 50 facebook credits', :price => 50, :reveals_to_add => 1 )


end
