class UsersController < ApplicationController
  before_filter :require_user, :except => [:new, :create]
  before_filter :require_no_user, :only => [:new, :create]

  def show
    @user = current_user

    respond_to do |format| 
      format.html
      format.js { render :json => @user }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params['user'])
    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path,
                      :notice => 'Registration successful' }
        format.json { render :json => @user,
                      :status => :created,
                      :location => user_path }
      else
        format.html { render :action => "new" }
        format.json { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    respond_to do |format|
      if @user.update_attributes(params['user'])
        format.html { redirect_to user_path,
                      :notice => 'Edited user' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @user.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
