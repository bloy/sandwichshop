require 'spec_helper'

describe "user_sessions/index.html.erb" do
  describe "logged out", :user => :anonymous do
    it "contains text that tells the user to log in" do
      view.stub(:logged_in? => false)
      render
      rendered.should =~ /registered and logged in/
    end
  end

  describe "logged in", :user => :normal do
    it "contains text telling you place an order" do
      view.stub(:logged_in? => true)
      render
      rendered.should =~ /using the links/
    end
  end
end
