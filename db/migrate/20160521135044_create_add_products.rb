class CreateAddProducts < ActiveRecord::Migration
  def change
  	Product.create ({ 
  		:title => 'Hawaiian', 
  		:description => 'This is hawaiian pizza', 
  		:price => 350, 
  		:size => 30, 
  		:is_spicy => false, 
  		:is_veg => false, 
  		:best_offer => false, 
  		:path_to_image => '/images/hawaiian.jpg'
  		})

	Product.create ({
		:title => 'Pepperoni',
		:description => 'Nice pepperoni pizza',
		:price => 450,
		:size => 30,
		:is_spicy => false,
		:is_veg => false,
		:best_offer => true,
		:path_to_image => '/images/pepperoni.jpg'
		})

	Product.create ({
		:title => 'Vegetarian',
		:description => 'Good vegetarian pizza',
		:price => 400,
		:size => 30,
		:is_spicy => false,
		:is_veg => false,
		:best_offer => false,
		:path_to_image => '/images/veg.jpg'
		})
  end
end
