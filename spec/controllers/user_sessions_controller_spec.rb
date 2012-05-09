require 'spec_helper'

describe UserSessionsController do
  include Authlogic::TestCase
  USER_PASSWORD = 'changeme'
  let(:user) do
    FactoryGirl.create(:user,
                       :email => 'test@example.com',
                       :password => USER_PASSWORD,
                       :password_confirmation => USER_PASSWORD)
  end

  describe "GET 'index'" do
    before(:each) { get :index }
    it { should respond_with(:success) }
    it { should render_template(:index) }
  end

  describe "while not logged in" do
    describe "GET 'new'" do
      before(:each) { get 'new' }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should assign_to(:user_session).with_kind_of(UserSession) }
    end

    describe "POST 'create'" do
      describe "with successful login" do
        before(:each) {
          post 'create', :user_session => { :email => user.email,
                                            :password => USER_PASSWORD }
        }
        it { should redirect_to(root_path) }
        it { should set_the_flash[:notice].to(/Login successful/) }
        it "should create a user session" do
          controller.send(:current_user).should_not be_nil
        end
      end
      describe "with unsuccessful login" do
        before(:each) {
          post 'create', :user_session => { :email => user.email,
                                            :password => 'chdfg' }
        }
        it { should render_template('new') }
      end
    end

    describe "DELETE 'destroy'" do
      before(:each) { delete 'destroy' }
      it { should redirect_to(new_user_session_path) }
      it { should set_the_flash[:notice].to(/must be logged in/) }
    end
  end

  describe "while logged in", :user => :normal do
    describe "GET 'new'" do
      before(:each) { get 'new' }
      it { should redirect_to(root_path) }
      it { should set_the_flash[:notice].to(/must be logged out/) }
    end

    describe "POST 'create'" do
      before(:each) { post 'create' }
      it { should redirect_to(root_path) }
      it { should set_the_flash[:notice].to(/must be logged out/) }
    end

    describe "DELETE 'destroy'" do
      before(:each) { delete 'destroy' }
      it { should redirect_to(root_path) }
      it { should set_the_flash[:notice].to(/Logout successful/) }
      it "should destroy the user session" do
        UserSession.find.should be_nil
      end
    end
  end
end
