require 'spec_helper'
describe "users/show.html.erb" do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    assign(:user, user)
    render
  end

  it "contains text from the user data" do
    rendered.should =~ /#{user.first_name}/
    rendered.should =~ /#{user.last_name}/
  end

  it "contains login information" do
    rendered.should =~ /Last Login/
  end

  it "contains links" do
    rendered.should =~ /Edit/
  end
end
