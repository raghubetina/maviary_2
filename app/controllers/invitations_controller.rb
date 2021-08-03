class InvitationsController < ApplicationController
  before_action :current_user_must_be_invitation_sender,
                only: %i[edit update destroy]

  before_action :set_invitation, only: %i[show edit update destroy]

  def index
    @q = current_user.sent_invitations.ransack(params[:q])
    @invitations = @q.result(distinct: true).includes(:sender, :recipient,
                                                      :clicked_sender, :chat).page(params[:page]).per(10)
  end

  def show; end

  def new
    @invitation = Invitation.new
  end

  def edit; end

  def create
    @invitation = Invitation.new(invitation_params)

    if @invitation.save
      message = "Invitation was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @invitation, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @invitation.update(invitation_params)
      redirect_to @invitation, notice: "Invitation was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @invitation.destroy
    message = "Invitation was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to invitations_url, notice: message
    end
  end

  private

  def current_user_must_be_invitation_sender
    set_invitation
    unless current_user == @invitation.sender
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:chat_id, :recipient_id, :token,
                                       :clicked, :rsvp_status, :role, :sender_id)
  end
end
