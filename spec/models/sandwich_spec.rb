# == Schema Information
# Schema version: 20120510041605
#
# Table name: sandwiches
#
#  id               :integer         not null, primary key
#  ordered_at       :datetime        not null
#  completed_at     :datetime
#  ordered_by_id    :integer         not null
#  completed_by_id  :integer
#  bread_id         :integer         not null
#  sandwich_size_id :integer         not null
#
# Indexes
#
#  index_sandwiches_on_sandwich_size_id  (sandwich_size_id)
#  index_sandwiches_on_bread_id          (bread_id)
#  index_sandwiches_on_completed_by_id   (completed_by_id)
#  index_sandwiches_on_ordered_by_id     (ordered_by_id)
#

require 'spec_helper'

describe Sandwich do
  let(:sandwich) { FactoryGirl.create(:sandwich) }
  it { should have_db_column(:ordered_at) }
  it { should have_db_column(:ordered_by_id) }
  it { should have_db_column(:completed_at) }
  it { should have_db_column(:completed_by_id) }
  it { should have_db_column(:bread_id) }
  it { should have_db_column(:sandwich_size_id) }
  it { should validate_presence_of(:ordered_at) }
  it { should validate_presence_of(:ordered_by_id) }
  it { should validate_presence_of(:bread_id) }
  it { should validate_presence_of(:sandwich_size_id) }
  it { should belong_to(:bread) }
  it { should belong_to(:sandwich_size) }
  it { should belong_to(:ordered_by).class_name("User") }
  it { should belong_to(:completed_by).class_name("User") }
  it { should have_and_belong_to_many(:toppings) }

  it "should know it is open" do
    sandwich.should be_open
    sandwich.status.should == 'OPEN'
  end

  it "should know it is closed" do
    sandwich.completed_at = Time.now
    sandwich.completed_by = sandwich.ordered_by
    sandwich.save
    sandwich.should_not be_open
    sandwich.status.should == "CLOSED"
  end

  describe "scopes" do
    before(:each) do
      FactoryGirl.create(:sandwich)
      FactoryGirl.create(:completed_sandwich)
    end
    it "should have an open named scope" do
      Sandwich.open.count.should == 1
    end
    it "should have a closed named scope" do
      Sandwich.closed.count.should == 1
    end
  end
end
