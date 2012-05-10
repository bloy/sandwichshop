class SandwichesController < ApplicationController
  before_filter :require_user

  def index
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
    @sandwich = Sandwich.new
    @sandwich.bread_id = params[:sandwich][:bread_id]
    @sandwich.sandwich_size_id = params[:sandwich][:sandwich_size_id]
    @sandwich.ordered_by = current_user
    @sandwich.ordered_at = Time.now
    params[:toppings] && params[:toppings].each do |topping_id|
      topping = Topping.find_by_id(topping_id)
      @sandwich.toppings << topping if topping
    end
    respond_to do |format|
      if @sandwich.save
        format.html { redirect_to @sandwich, :notice => 'Order Created' }
        format.json { render :json => @sandwich, :status => :created,
                      :location => @sandwich }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @sandwich.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def my_orders
  end
end
