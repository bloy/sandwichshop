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
  factory :topping, :aliases => [:turkey] do
    name "turkey"
    association :topping_type, :factory => :meat

    factory :cheddar do
      name "cheddar"
      association :topping_type, :factory => :cheese
    end

    factory :lettuce do
      name "lettuce"
      association :topping_type, :factory => :veggie
    end

    factory :mustard do
      name "mustard"
      association :topping_type, :factory => :dressing
    end
  end
end
