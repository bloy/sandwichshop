require 'spec_helper'

describe SessionController do

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
end
