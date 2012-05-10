# == Schema Information
# Schema version: 20120510034232
#
# Table name: topping_types
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

class ToppingType < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
  has_many :toppings, :inverse_of => :topping_type
end
