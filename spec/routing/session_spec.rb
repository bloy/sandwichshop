require 'spec_helper'

describe "routing to session" do
  it "routes / to session#index" do
    { :get => "/" }.should route_to(:controller => 'sessions',
                                    :action => 'index')
  end

  it 'routes /session/new to session#new' do
    { :get => '/session/new' }.should route_to(:controller => 'sessions',
                                               :action => 'new')
  end

  it 'routes /session (POST) to session#create' do
    { :post => '/session' }.should route_to(:controller => 'sessions',
                                            :action => 'create')
  end

  it 'routes /session (DELETE) to session#destroy' do
    { :delete => '/session' }.should route_to(:controller => 'sessions',
                                              :action => 'destroy')
  end
end
