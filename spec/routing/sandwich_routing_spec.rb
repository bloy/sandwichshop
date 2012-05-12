require 'spec_helper'

describe "Routing to sandwich" do
  it "routes /sandwiches to sandwiches#index" do
    { :get => '/sandwiches' }.should route_to(
      :controller => "sandwiches", :action => "index"
    )
  end

  it "routes /sandwiches/:id to sandwiches#show" do
    { :get => '/sandwiches/1' }.should route_to(
      :controller => "sandwiches", :action => "show", :id => "1"
    )
  end

  it "routes /sandwiches/new to sandwiches#new" do
    { :get => '/sandwiches/new' }.should route_to(
      :controller => "sandwiches", :action => "new"
    )
  end

  it "routes /sandwiches(POST) to sandwiches#create" do
    { :post => '/sandwiches' }.should route_to(
      :controller => "sandwiches", :action => "create"
    )
  end

  it 'routes /sandwiches/open to sandwiches#open' do
    { :get => '/sandwiches/open' }.should route_to(
      :controller => 'sandwiches', :action => 'open'
    )
  end

  it 'routes /sandwiches/closed to sandwiches#closed' do
    { :get => '/sandwiches/closed' }.should route_to(
      :controller => 'sandwiches', :action => 'closed'
    )
  end

  it 'routes /sandwiches/:id/close to sandwiches#close' do
    { :post => '/sandwiches/1/close' }.should route_to(
      :controller => 'sandwiches', :action => 'close', :id => "1"
    )
  end
end
