require 'spec_helper'

describe "user_sessions/index.html.erb" do
  it "contains text that tells the user to log in" do
    render
    rendered.should =~ /registered and logged in/
  end
end