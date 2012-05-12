require 'spec_helper'

describe "sandwiches/show.html.erb" do
  let(:sandwich) { FactoryGirl.create(:sandwich_with_toppings) }

  describe "regular user" do
    before(:each) do
      view.stub(:admin? => false)
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

    it "does not display admin-only information" do
      rendered.should_not =~ /Ordered By/
      rendered.should_not =~ /Status/
    end
  end

  describe "admin" do
    before(:each) do
      view.stub(:admin? => true)
      assign(:sandwich, sandwich)
      render
    end
    it "displays admin-only information" do
      rendered.should =~ /Ordered By/
      rendered.should =~ /Status/
    end
  end
end
