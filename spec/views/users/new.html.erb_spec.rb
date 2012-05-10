require 'spec_helper'

describe "users/new.html.erb" do
  before(:each) do
    assign(:user, User.new)
    render
  end

  it "renders form partial" do
    view.should render_template(:partial => "_form", :count => 1)
  end

  it "contains instructions" do
    rendered.should =~ /Fill out the registration below/
  end
end
