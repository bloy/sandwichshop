class SandwichesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:open, :closed]

  def index
    @sandwiches = Sandwich.find_all_by_ordered_by_id(current_user.id)
  end

  def open
    @sandwiches = Sandwich.open
  end

  def closed
    @sandwiches = Sandwich.closed
  end

  def show
    @sandwich = Sandwich.find_by_id_and_ordered_by_id(params[:id], current_user.id)
    respond_to do |format|
      if @sandwich
        format.html
        format.json { render :json => @sandwich }
      else
        format.html { redirect_to root_path }
        format.json { render :json => {:error => true},
                      :status => :unprocessable_entity }
      end
    end
  end

  def new
    @sandwich = Sandwich.new
  end

  def create
    @sandwich = Sandwich.new(params[:sandwich])
    @sandwich.ordered_by = current_user
    @sandwich.ordered_at = Time.now
    respond_to do |format|
      if @sandwich.save
        format.html { redirect_to @sandwich, :notice => 'Order Created' }
        format.json { render :json => @sandwich, :status => :created, :location => @sandwich }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @sandwich.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
