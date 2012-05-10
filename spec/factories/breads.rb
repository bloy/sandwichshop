# == Schema Information
# Schema version: 20120510032209
#
# Table name: breads
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)     not null
#

FactoryGirl.define do
  factory :bread do
    name "white"
    description "white bread"
  end
end
