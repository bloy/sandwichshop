require 'spec_helper'

describe "routing to user_session" do
  it "routes / to user_sessions#index" do
    { :get => "/" }.should route_to(:controller => 'user_sessions',
                                    :action => 'index')
  end

  it 'routes /user_session/new to user_sessions#new' do
    { :get => '/user_session/new' }.should route_to(
      :controller => 'user_sessions',
      :action => 'new'
    )
  end

  it 'routes /user_session (POST) to user_sessions#create' do
    { :post => '/user_session' }.should route_to(
      :controller => 'user_sessions',
      :action => 'create'
    )
  end

  it 'routes /user_session (DELETE) to user_sessions#destroy' do
    { :delete => '/user_session' }.should route_to(
      :controller => 'user_sessions',
      :action => 'destroy'
    )
  end
end
