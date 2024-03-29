require 'spec_helper'

describe SandwichesController do
  let(:sandwich) { FactoryGirl.create(:sandwich) }
  describe "GET 'show'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'show', :id => sandwich.id }
    end

    describe "logged in", :user => :normal do
      describe "correct id" do
        before(:each) do
          sandwich.ordered_by = current_user
          sandwich.save
          get 'show', :id => sandwich.id
        end
        it { should respond_with(:success) }
        it { should render_template(:show) }
        it { should assign_to(:sandwich).with(sandwich) }
      end

      describe "incorrect id" do
        before(:each) do
          sandwich.ordered_by = current_user
          sandwich.save
          get 'show', :id => sandwich.id + 1000
        end
        it { should redirect_to root_path }
      end
    end

    describe "admin can see other users sandwiches", :user => :admin do
      before(:each) do
        sandwich.ordered_by = FactoryGirl.create(:user)
        sandwich.save
        get 'show', :id => sandwich.id
      end
      it { should respond_with(:success) }
      it { should render_template(:show) }
      it { should assign_to(:sandwich).with(sandwich) }
    end
  end

  describe "GET 'new'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'new' }
    end

    describe "logged in", :user => :normal do
      before(:each) { get 'new' }
      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should assign_to(:sandwich).with_kind_of(Sandwich) }
    end
  end

  describe "POST 'create'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { post 'create' }
    end

    describe "logged in", :user => :normal do
      before(:each) do
        attrs = FactoryGirl.attributes_for(:sandwich)
        attrs.delete_if{|k,v|
          [:ordered_at, :ordered_by, :completed_at, :completed_by].include?(k)
        }
        attrs[:bread_id] = FactoryGirl.create(:bread).id
        attrs[:sandwich_size_id] = FactoryGirl.create(:sandwich_size).id
        post 'create', :sandwich => attrs
      end
      it { should redirect_to(:action => :show, :id => 1) }
    end
  end

  describe "GET 'index'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'index' }
    end

    describe "logged in", :user => :normal do
      before(:each) do
        FactoryGirl.create(:sandwich)
        FactoryGirl.create(:sandwich)
        Sandwich.all.each{|i| i.update_attribute(:ordered_by_id, current_user.id)}
        get 'index'
      end
      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should assign_to(:sandwiches).with(Sandwich.all) }
    end
  end

  describe "GET 'open'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'open' }
    end

    describe "not admin", :user => :normal, :filter => :require_admin do
      before(:each) { get 'open'}
    end

    describe "admin", :user => :admin do
      before(:each) { get 'open'}
      it { should assign_to(:sandwiches).with(Sandwich.open) }
      it { should render_template(:open) }
      it { should respond_with(:success) }
    end
  end

  describe "GET 'closed'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { get 'closed' }
    end

    describe "not admin", :user => :normal, :filter => :require_admin do
      before(:each) { get 'closed'}
    end

    describe "admin", :user => :admin do
      before(:each) { get 'closed'}
      it { should assign_to(:sandwiches).with(Sandwich.closed) }
      it { should render_template(:closed) }
      it { should respond_with(:success) }
    end
  end

  describe "POST 'close'" do
    describe "not logged in", :filter => :require_user do
      before(:each) { post 'close' }
    end

    describe "not admin", :user => :normal, :filter => :require_admin do
      before(:each) { post 'close'}
    end

    describe "admin", :user => :admin do
      before(:each) { post 'close', :id => sandwich.id }
      it { should redirect_to(open_sandwiches_path) }
      it "should close the sandwich" do
        Sandwich.find(sandwich.id).should_not be_open
      end
    end
  end
end
