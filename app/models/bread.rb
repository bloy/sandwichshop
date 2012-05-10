# == Schema Information
# Schema version: 20120510032209
#
# Table name: breads
#
#  id          :integer         not null, primary key
#  name        :string(255)     not null
#  description :string(255)     not null
#

class Bread < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :description, :name
end
