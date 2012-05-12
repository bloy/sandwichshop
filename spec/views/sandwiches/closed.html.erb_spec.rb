require 'spec_helper'

describe "sandwiches/closed.html.erb" do
  let(:sandwiches) {[
    FactoryGirl.create(:completed_sandwich),
    FactoryGirl.create(:completed_sandwich),
    FactoryGirl.create(:completed_sandwich)
  ]}
  before(:each) do
    assign(:sandwiches, sandwiches)
    render
  end

  it "renders _sandwich partial for each sandwich" do
    view.should render_template(:partial => '_sandwich', :count => 3)
  end
end
