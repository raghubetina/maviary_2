class ContactsController < ApplicationController
  before_action :current_user_must_be_contact_adder,
                only: %i[edit update destroy]

  before_action :set_contact, only: %i[show edit update destroy]

  # GET /contacts
  def index
    @q = current_user.contacts_as_adder.ransack(params[:q])
    @contacts = @q.result(distinct: true).includes(:adder, :added,
                                                   :circles_contacts, :circles).page(params[:page]).per(10)
  end

  # GET /contacts/1
  def show
    @circles_contact = CirclesContact.new
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit; end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      message = "Contact was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @contact, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: "Contact was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    message = "Contact was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to contacts_url, notice: message
    end
  end

  private

  def current_user_must_be_contact_adder
    set_contact
    unless current_user == @contact.adder
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:contact).permit(:adder_id, :name, :added_id, :email,
                                    :picture)
  end
end
