class CirclesController < ApplicationController
  before_action :set_circle, only: [:show, :edit, :update, :destroy]

  # GET /circles
  def index
    @circles = Circle.all
  end

  # GET /circles/1
  def show
    @circles_contact = CirclesContact.new
  end

  # GET /circles/new
  def new
    @circle = Circle.new
  end

  # GET /circles/1/edit
  def edit
  end

  # POST /circles
  def create
    @circle = Circle.new(circle_params)

    if @circle.save
      message = 'Circle was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @circle, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /circles/1
  def update
    if @circle.update(circle_params)
      redirect_to @circle, notice: 'Circle was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circles/1
  def destroy
    @circle.destroy
    message = "Circle was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to circles_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circle
      @circle = Circle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def circle_params
      params.require(:circle).permit(:name, :user_id, :picture)
    end
end
