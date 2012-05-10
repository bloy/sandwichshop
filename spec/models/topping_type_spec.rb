# == Schema Information
# Schema version: 20120510034232
#
# Table name: topping_types
#
#  id   :integer         not null, primary key
#  name :string(255)     not null
#

require 'spec_helper'

describe ToppingType do
  it { should have_db_column(:name) }
  it { should validate_presence_of(:name) }
  it { should have_many(:toppings) }
end
