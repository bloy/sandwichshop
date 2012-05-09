require 'spec_helper'

describe ApplicationController do
  include Authlogic::TestCase

  describe "user session helpers" do
    USER_PASSWORD = 'changeme'
    let(:user) do
      FactoryGirl.create(:user,
                         :email => 'test@example.com',
                         :password => USER_PASSWORD,
                         :password_confirmation => USER_PASSWORD)
    end
    before(:each) do
      activate_authlogic
    end

    describe "logged out" do
      it "returns nil for current_user" do
        controller.send(:current_user).should be_nil
      end

      it "returns nil for current_user_session" do
        controller.send(:current_user_session).should be_nil
      end
    end

    describe "logged in" do
      before(:each) do
        UserSession.create(user)
      end

      it "returns user for current_user" do
        controller.send(:current_user).should == user
      end

      it "returns a UserSession for current_user_session" do
        controller.send(:current_user_session).should be_a(UserSession)
      end
    end
  end
end
