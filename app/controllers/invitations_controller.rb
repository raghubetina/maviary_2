class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  def index
    @invitations = Invitation.all
  end

  # GET /invitations/1
  def show
  end

  # GET /invitations/new
  def new
    @invitation = Invitation.new
  end

  # GET /invitations/1/edit
  def edit
  end

  # POST /invitations
  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      message = 'Invitation was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @invitation, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /invitations/1
  def update
    if @invitation.update(invitation_params)
      redirect_to @invitation, notice: 'Invitation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /invitations/1
  def destroy
    @invitation.destroy
    message = "Invitation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to invitations_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def invitation_params
      params.require(:invitation).permit(:chat_id, :user_id, :token, :clicked, :rsvp_status)
    end
end
