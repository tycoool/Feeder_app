class FeedsController < ApplicationController

  before_action :set_feed, only: [:show, :edit, :update, :destroy]


  # GET /feeds
  def index
    @q = Feed.ransack(params[:q])
    @feeds = @q.result.paginate(:page => params[:page])
  end

  # GET /feeds/1
  def show
  end

  # GET /feeds/new
  def new
    @feed = Feed.new
  end

  # GET /feeds/1/edit
  def edit
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    respond_to do |format|
      if @feed.save
        format.html { redirect_to @feed, notice: 'Feed successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /feeds/1
  def update
    respond_to do |format|
      if @feed.update(feed_params)
        format.html { redirect_to @feed, notice: 'Feed successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
    respond_to do |format|
      format.html { redirect_to feeds_url, notice: 'Feed successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feed_params
      params.require(:feed).permit(:name, :url)
    end
end
