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

  describe "scopes" do
    before(:each) do
      [:turkey, :cheddar, :lettuce, :mustard].each { |i| FactoryGirl.create(i) }
      Topping.count.should == 4
    end

    it "should have a meats named scope" do
      Topping.meats.count.should == 1
    end

    it "should have a cheeses named scope" do
      Topping.cheeses.count.should == 1
    end

    it "should have a veggies named scope" do
      Topping.veggies.count.should == 1
    end

    it "should have a dressings named scope" do
      Topping.dressings.count.should == 1
    end
  end
end
