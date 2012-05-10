# == Schema Information
# Schema version: 20120510033440
#
# Table name: sandwich_sizes
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

class SandwichSize < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name
end
