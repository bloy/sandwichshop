# == Schema Information
# Schema version: 20120510034232
#
# Table name: topping_types
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

FactoryGirl.define do
  factory :topping_type, :aliases => [:meat] do
    name "Meat"

    factory :cheese do
      name "Cheese"
    end

    factory :veggie do
      name "Vegetable"
    end

    factory :dressing do
      name "Dressing"
    end
  end
end
