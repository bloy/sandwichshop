require 'spec_helper'

describe UsersController do

  describe "GET 'show'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'show' }
    end

    describe "logged in", :user => :normal do
      before(:each) { get 'show' }
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should assign_to(:user).with(current_user) }
    end
  end

  describe "GET 'new'" do
    describe "not logged in" do
      before(:each) { get 'new' }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should assign_to(:user).with_kind_of(User) }
    end

    describe "logged in", :user => :normal, :filter => :require_no_user do
      before(:each) { get 'new' }
    end

  end

  describe "POST 'create'" do
    describe "not logged in" do
      describe "correct data" do
        before(:each) {
          post 'create',
            :user => FactoryGirl.attributes_for(:user).
            reject{|k,v| k == :admin} }
        it { should redirect_to(user_path) }
        it { should set_the_flash[:notice].to(/successful/) }
      end
      describe "bad data" do
        before(:each) { post 'create' }
        it { should render_template(:new) }
      end
    end

    describe "logged in", :user => :normal, :filter => :require_no_user do
      before(:each) { post 'create' }
    end
  end

  describe "GET 'edit'" do

    describe "not logged in", :filter => :require_user do
      before(:each) { get 'edit' }
    end

    describe "logged in", :user => :normal do
      before(:each) { get 'edit' }
      it { should respond_with(:success) }
      it { should assign_to(:user).with(current_user) }
      it { should render_template(:edit) }
    end
  end

  describe "PUT 'update'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { put 'update' }
    end

    describe "logged in", :user => :normal do
      before(:each) { put 'update',
                      :user => FactoryGirl.attributes_for(:user).
                      reject{|k,v| k == :admin } }
      it { should redirect_to(user_path) }
      it { should set_the_flash[:notice].to(/Edit/) }
    end
  end

end
