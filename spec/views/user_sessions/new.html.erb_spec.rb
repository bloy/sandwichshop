require 'spec_helper'

describe "user_sessions/new.html.erb" do
  include Authlogic::TestCase
  before(:each) do
    activate_authlogic
    assign(:user_session, stub_model(UserSession))
  end
  it "contains email form text" do
    render
    rendered.should =~ /Email/
  end

  it "contains password form text" do
    render
    rendered.should =~ /Password/
  end
end
