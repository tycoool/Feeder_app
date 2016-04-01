class EntriesController < ApplicationController

  # GET /entries
  def index
    @q = Entry.ransack(params[:q])
    if params[:likes] == "true"
      @entries = @q.result.likes.paginate(:page => params[:page])
    else
      @entries = @q.result.paginate(:page => params[:page])
    end
  end

  # PATCH/PUT /entry/1/toggle_like
  def toggle_like
    if e = Entry.find(params[:id])
      e.toggle!(:like) # Skips validations
    end
    #render :nothing => true
    respond_to do |format|
          format.js
    end
  end

end
