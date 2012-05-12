require 'spec_helper'

describe "sandwiches/new.html.erb" do
  before(:each) do
    assign(:sandwich, Sandwich.new)
    render
  end

  it "Contains 'Toppings'" do
    rendered.should =~ /Toppings/
  end

  it "renders the form partial" do
    view.should render_template(:partial => '_form')
  end
end
