require 'spec_helper'

describe "users/edit.html.erb" do
  let(:user) { FactoryGirl.create(:user) }
  before(:each) do
    assign(:user, user)
    render
  end

  it "renders form partial" do
    view.should render_template(:partial => "_form", :count => 1)
  end

  it "contains instructions" do
    rendered.should =~ /Edit your profile/
  end

  it "contains password information" do
    rendered.should =~ /password/
  end
end
