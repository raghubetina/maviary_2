class CirclesContactsController < ApplicationController
  before_action :set_circles_contact, only: %i[show edit update destroy]

  def index
    @q = CirclesContact.ransack(params[:q])
    @circles_contacts = @q.result(distinct: true).includes(:contact,
                                                           :circle).page(params[:page]).per(10)
  end

  def show; end

  def new
    @circles_contact = CirclesContact.new
  end

  def edit; end

  def create
    @circles_contact = CirclesContact.new(circles_contact_params)

    if @circles_contact.save
      message = "CirclesContact was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @circles_contact, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @circles_contact.update(circles_contact_params)
      redirect_to @circles_contact,
                  notice: "Circles contact was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @circles_contact.destroy
    message = "CirclesContact was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to circles_contacts_url, notice: message
    end
  end

  private

  def set_circles_contact
    @circles_contact = CirclesContact.find(params[:id])
  end

  def circles_contact_params
    params.require(:circles_contact).permit(:circle_id, :contact_id)
  end
end
