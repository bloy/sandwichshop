require 'spec_helper'

describe "user_sessions/new.html.erb" do
  include Authlogic::TestCase
  before(:each) do
    activate_authlogic
    assign(:user_session, stub_model(UserSession))
    render
  end
  it "contains email form text" do
    rendered.should =~ /Email/
  end

  it "contains password form text" do
    rendered.should =~ /Password/
  end

  it "contains a link to the register screen" do
    rendered.should =~ /Create an account/
  end
end
