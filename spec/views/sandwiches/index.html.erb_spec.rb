require 'spec_helper'

describe "sandwiches/index.html.erb" do
  let(:sandwiches) {[
    FactoryGirl.create(:sandwich),
    FactoryGirl.create(:sandwich),
    FactoryGirl.create(:sandwich)
  ]}
  before(:each) do
    assign(:sandwiches, sandwiches)
    render
  end

  it "contains 'My Open Orders'" do
    rendered.should =~ /My Open Orders/
  end

  it "contains 'My Previous Orders'" do
    rendered.should =~ /My Previous Orders/
  end

  it "renders _sandwich partial for each sandwich" do
    view.should render_template(:partial => '_sandwich', :count => 3)
  end
end
