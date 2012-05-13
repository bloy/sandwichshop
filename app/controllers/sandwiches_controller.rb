class SandwichesController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [:open, :closed, :close]

  def index
    @sandwiches = Sandwich.find_all_by_ordered_by_id(current_user.id)

    respond_to do |format|
      format.html
      format.json { render :json => @sandwiches }
    end
  end

  def open
    @sandwiches = Sandwich.open

    respond_to do |format|
      format.html
      format.json { render :json => @sandwiches }
    end
  end

  def closed
    @sandwiches = Sandwich.closed

    respond_to do |format|
      format.html
      format.json { render :json => @sandwiches }
    end
  end

  def show
    if admin?
      @sandwich = Sandwich.find_by_id(params[:id])
    else
      @sandwich = Sandwich.find_by_id_and_ordered_by_id(params[:id],
                                                        current_user.id)
    end

    respond_to do |format|
      if @sandwich
        format.html
        format.xml { render :partial => 'sandwich',
                     :formats => [:html],
                     :locals => {
                       :sandwich => @sandwich,
                       :admin => false,
                       :closed => true }
        }
        format.json { render :json => {
          :obj => @sandwich,
          :id => @sandwich.id,
          :status => @sandwich.status,
          :html => render_to_string(
            :partial => 'sandwich',
            :formats => [:html],
            :locals => {
              :sandwich => @sandwich,
              :admin => false,
              :closed => true })
        } }
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
        format.json { render :json => @sandwich,
                      :status => :created, :location => @sandwich }
      else
        format.html { render :action => 'new' }
        format.json { render :json => @sandwich.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  def close
    @sandwich = Sandwich.find_by_id(params[:id])
    @sandwich = nil unless @sandwich && @sandwich.open?

    @sandwich.complete(current_user) if @sandwich

    respond_to do |format|
      if @sandwich && @sandwich.save
        format.html { redirect_to open_sandwiches_path }
        format.json { render :json => @sandwich,
                      :status => :success, :location => open_sandwiches_path }
      else
        format.html {
          flash[:notice] = "Error while attempting to close sandwich"
          redirect_to request.env['HTTP_REFERER']
        }
        format.json { render :json => @sandwich.errors,
                      :status => :unprocessable_entity }
      end
    end
  end
end
