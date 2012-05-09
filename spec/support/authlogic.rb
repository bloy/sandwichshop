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
    controller.logger.debug("PONIES: logging in: " + current_user.inspect)
    activate_authlogic
    UserSession.create(current_user)
  end
end
