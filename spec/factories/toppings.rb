# == Schema Information
# Schema version: 20120510034836
#
# Table name: toppings
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  topping_type_id :integer         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topping do
    name "turkey"
    topping_type ""
  end
end
