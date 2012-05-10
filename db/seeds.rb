# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Bread.create([{ :name => 'White', :description => 'White Bread'},
              { :name => 'Wheat', :description => 'Wheat Bread'},
              { :name => 'Whole-Grain', :description => 'Whole Grain'},
              { :name => 'Gluten-free', :description => 'Gluten-free'}])

SandwichSize.create([{ :name => '6-inch sub' },
                     { :name => 'Footlong sub' },
                     { :name => 'Sandwich Style' },
                     { :name => 'Wrap' }])

meat = ToppingType.create(:name => 'Meat')
cheese = ToppingType.create(:name => 'Cheese')
veg = ToppingType.create(:name => 'Vegetable')
dressing = ToppingType.create(:name => 'Dressing')

Topping.create([
  { :name => 'Ham', :topping_type => meat },
  { :name => 'Turkey', :topping_type => meat },
  { :name => 'Roast Beef', :topping_type => meat },
  { :name => 'Salami', :topping_type => meat },
  { :name => 'Provolone', :topping_type => cheese },
  { :name => 'Cheddar', :topping_type => cheese },
  { :name => 'Swiss', :topping_type => cheese },
  { :name => 'Pepper Jack', :topping_type => cheese },
  { :name => 'Black Olives', :topping_type => veg },
  { :name => 'Green Pepper', :topping_type => veg },
  { :name => 'Sprouts', :topping_type => veg },
  { :name => 'Lettuce', :topping_type => veg },
  { :name => 'Pickle', :topping_type => veg },
  { :name => 'Onion', :topping_type => veg },
  { :name => 'Tomato', :topping_type => veg },
  { :name => 'Mayo', :topping_type => dressing },
  { :name => 'Yellow Mustard', :topping_type => dressing },
  { :name => 'Brown Mustard', :topping_type => dressing },
  { :name => 'Oil', :topping_type => dressing }])
