class CirclesController < ApplicationController
  before_action :current_user_must_be_circle_user,
                only: %i[edit update destroy]

  before_action :set_circle, only: %i[show edit update destroy]

  def index
    @q = current_user.circles.ransack(params[:q])
    @circles = @q.result(distinct: true).includes(:user, :circles_contacts,
                                                  :contacts).page(params[:page]).per(10)
  end

  def show
    @circles_contact = CirclesContact.new
  end

  def new
    @circle = Circle.new
  end

  def edit; end

  def create
    @circle = Circle.new(circle_params)

    if @circle.save
      message = "Circle was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @circle, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @circle.update(circle_params)
      redirect_to @circle, notice: "Circle was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @circle.destroy
    message = "Circle was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to circles_url, notice: message
    end
  end

  private

  def current_user_must_be_circle_user
    set_circle
    unless current_user == @circle.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_circle
    @circle = Circle.find(params[:id])
  end

  def circle_params
    params.require(:circle).permit(:name, :user_id, :picture)
  end
end
