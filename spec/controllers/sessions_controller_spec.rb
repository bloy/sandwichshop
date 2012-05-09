require 'spec_helper'

describe SessionsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "renders index" do
      get 'index'
      response.should render_template(:index)
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "renders new" do
      get 'new'
      response.should render_template(:new)
    end
  end

  describe "POST 'create'" do
    it "redirects to index" do
      pending
      post 'create'
      response.should redirect_to(:index)
    end
  end
end
