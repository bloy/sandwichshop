# == Schema Information
# Schema version: 20120510034836
#
# Table name: toppings
#
#  id              :integer         not null, primary key
#  name            :string(255)     not null
#  topping_type_id :integer         not null
#

require 'spec_helper'

describe Topping do
  it { should have_db_column(:name) }
  it { should have_db_column(:topping_type_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:topping_type_id) }
  it { should belong_to(:topping_type) }
end
