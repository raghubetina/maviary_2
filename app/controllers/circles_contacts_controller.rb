class CirclesContactsController < ApplicationController
  before_action :set_circles_contact, only: [:show, :edit, :update, :destroy]

  # GET /circles_contacts
  def index
    @q = CirclesContact.ransack(params[:q])
    @circles_contacts = @q.result(:distinct => true).includes(:contact, :circle).page(params[:page]).per(10)
  end

  # GET /circles_contacts/1
  def show
  end

  # GET /circles_contacts/new
  def new
    @circles_contact = CirclesContact.new
  end

  # GET /circles_contacts/1/edit
  def edit
  end

  # POST /circles_contacts
  def create
    @circles_contact = CirclesContact.new(circles_contact_params)

    if @circles_contact.save
      message = 'CirclesContact was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @circles_contact, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /circles_contacts/1
  def update
    if @circles_contact.update(circles_contact_params)
      redirect_to @circles_contact, notice: 'Circles contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /circles_contacts/1
  def destroy
    @circles_contact.destroy
    message = "CirclesContact was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to circles_contacts_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_circles_contact
      @circles_contact = CirclesContact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def circles_contact_params
      params.require(:circles_contact).permit(:circle_id, :contact_id)
    end
end
