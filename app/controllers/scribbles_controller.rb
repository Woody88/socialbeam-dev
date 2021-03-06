class ScribblesController < ApplicationController
  before_action :set_scribble, only: [:show, :edit, :update, :destroy]

  # GET /scribbles
  # GET /scribbles.json
  def index
    @scribbles = Scribble.all(:order => 'scribbles.created_at DESC')
      respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @scribbles }
    end
  end

  # GET /scribbles/1
  # GET /scribbles/1.json
  def show

     respond_to do |format|
      format.html #index.html.erb
      format.json { render :json => @scribbles }
    end 
  end

  # GET /scribbles/new
  def new
    @scribble = Scribble.new
  end

  # GET /scribbles/1/edit
  def edit
  end

  # POST /scribbles
  # POST /scribbles.json
  def create
    @scribble = Scribble.new(scribble_params)
    @scribble.posted_by_uid = current_user.id
    @scribble.posted_by = current_user.first_name+" "+current_user.last_name
    @scribble.ups = 0
    @scribble.downs = 0
    @scribble.save

    respond_to do |format|
      if @scribble.save
        format.html { redirect_to root_path }
        format.json { render :json => @scribble, status: :created, location: @scribble }
      else
        format.html { redirect_to root_path }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scribbles/1
  # PATCH/PUT /scribbles/1.json
  def update
    respond_to do |format|
      if @scribble.update(scribble_params)
        format.html { redirect_to @scribble, notice: 'Scribble was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :edit }
        format.json { render json: @scribble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scribbles/1
  # DELETE /scribbles/1.json
  def destroy
    @scribble.destroy
    respond_to do |format|
      format.html { redirect_to scribbles_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scribble
      @scribble = Scribble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scribble_params
      params.require(:scribble).permit(:post, :post_by, :post_by_uid, :ups, :downs)
    end
end
