require 'spec_helper'

describe SandwichesController do
  let(:sandwich) { FactoryGirl.create(:sandwich) }
  describe "GET 'show'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'show', :id => sandwich.id }
    end

    describe "logged in", :user => :normal do
      before(:each) { get 'show', :id => sandwich.id }
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should assign_to(:sandwich).with(sandwich) }
    end
  end

  describe "GET 'new'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'new' }
    end

    describe "logged in", :user => :normal do
      before(:each) { get 'new' }
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should assign_to(:sandwich).with_kind_of(Sandwich) }
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      pending
      post 'create'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      pending
      get 'index'
      response.should be_success
    end
  end

end
