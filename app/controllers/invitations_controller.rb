class InvitationsController < ApplicationController
  before_action :set_invitation, only: %i[show edit update destroy]

  def index
    @q = Invitation.ransack(params[:q])
    @invitations = @q.result(distinct: true).includes(:user,
                                                      :chat).page(params[:page]).per(10)
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

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end

  def invitation_params
    params.require(:invitation).permit(:chat_id, :user_id, :token, :clicked,
                                       :rsvp_status)
  end
end
