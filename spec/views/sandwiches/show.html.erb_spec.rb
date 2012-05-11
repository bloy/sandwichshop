require 'spec_helper'

describe "sandwiches/show.html.erb" do
  let(:sandwich) { FactoryGirl.create(:sandwich_with_toppings) }
  before(:each) do 
    assign(:sandwich, sandwich) 
    render
  end

  it "contains '6-inch sub on white'" do
    rendered.should =~ /6-inch sub on white/
  end

  it "contains the ingredient list" do
    rendered.should =~ /cheddar/
    rendered.should =~ /turkey/
    rendered.should =~ /mustard/
    rendered.should =~ /lettuce/
  end
end
