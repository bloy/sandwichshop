require "authlogic/test_case"

shared_context "an anonymous user", :user => :anonymous do
  include Authlogic::TestCase
  let(:current_user) { nil }
  before(:each) do
    activate_authlogic
    user_session = UserSession.find
    user_session.destroy if user_session
  end
end

shared_context "a logged in user", :user => :normal do
  include Authlogic::TestCase
  let(:current_user) { FactoryGirl.create(:user) }
  before(:each) do
    activate_authlogic
    UserSession.create(current_user)
  end
end

shared_context "a logged in admin user", :user => :admin do
  include Authlogic::TestCase
  let(:current_user) { FactoryGirl.create(:admin) }
  before(:each) do
    activate_authlogic
    UserSession.create(current_user)
  end
end

shared_context "a controller method filtered by require_no_user",
  :filter => :require_no_user do
  it { should redirect_to(root_path) }
  it { should set_the_flash[:notice].to(/must be logged out/) }
end

shared_context "a controller method filtered by require_user",
  :filter => :require_user do
  it { should redirect_to(new_user_session_path) }
  it { should set_the_flash[:notice].to(/must be logged in/) }
end

shared_context "a controller method filtered by require_admin",
  :filter => :require_admin do
  it { should redirect_to(root_url) }
  it { should set_the_flash[:notice].to(/unauthorized access/) }
end
