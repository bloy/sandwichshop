# == Schema Information
# Schema version: 20120510034836
#A
# Table name: toppings
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  topping_type_id :integer         not null
#

class Topping < ActiveRecord::Base
  attr_accessible :name, :topping_type
  validates_presence_of :name, :topping_type_id
  belongs_to :topping_type, :inverse_of => :toppings

  { :meats => 'Meat',
    :cheeses => 'Cheese',
    :veggies => 'Vegetable',
    :dressings => 'Dressing'
  }.each do |scope_name, category_name|
    scope scope_name,
      joins(:topping_type).where(:topping_types => { :name => category_name })
  end
end
