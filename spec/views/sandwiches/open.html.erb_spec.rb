require 'spec_helper'

describe "sandwiches/open.html.erb" do
  let(:sandwiches) {[
    FactoryGirl.create(:sandwich),
    FactoryGirl.create(:sandwich),
    FactoryGirl.create(:sandwich)
  ]}
  before(:each) do
    assign(:sandwiches, sandwiches)
    render
  end

  it "renders _sandwich partial for each sandwich" do
    view.should render_template(:partial => '_sandwich', :count => 3)
  end
end
