# == Schema Information
# Schema version: 20120510033440
#
# Table name: sandwich_sizes
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

FactoryGirl.define do
  factory :sandwich_size do
    name "6-inch sub"
  end
end
