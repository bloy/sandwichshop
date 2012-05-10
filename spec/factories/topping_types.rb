# == Schema Information
# Schema version: 20120510034232
#
# Table name: topping_types
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

FactoryGirl.define do
  factory :topping_type do
    name "Meat"
  end
end
