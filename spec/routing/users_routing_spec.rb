require 'spec_helper'

describe "routing to users" do
  it 'routes /user to users#show' do
    { :get => '/user' }.should route_to(
      :controller => 'users', :action => 'show'
    )
  end

  it 'routes /user/new to users#new' do
    { :get => '/user/new' }.should route_to(
      :controller => 'users',
      :action => 'new'
    )
  end

  it 'routes /user(POST) to users#create' do
    { :post => '/user' }.should route_to(
      :controller => 'users',
      :action => 'create'
    )
  end

  it 'routes /user/edit to users#edit' do
    { :get => '/user/edit' }.should route_to(
      :controller => 'users',
      :action => 'edit'
    )
  end

  it 'routes /user(PUT) to users#update' do
    { :put => '/user' }.should route_to(
      :controller => 'users',
      :action => 'update'
    )
  end

end
