class ChatsController < ApplicationController
  before_action :current_user_must_be_chat_creator,
                only: %i[edit update destroy]

  before_action :set_chat, only: %i[show edit update destroy]

  def index
    @q = current_user.created_chats.ransack(params[:q])
    @chats = @q.result(distinct: true).includes(:creator, :invitations,
                                                :messages, :users).page(params[:page]).per(10)
  end

  def show
    @message = Message.new
    @invitation = Invitation.new
  end

  def new
    @chat = Chat.new
  end

  def edit; end

  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      message = "Chat was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @chat, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: "Chat was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @chat.destroy
    message = "Chat was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to chats_url, notice: message
    end
  end

  private

  def current_user_must_be_chat_creator
    set_chat
    unless current_user == @chat.creator
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:name, :creator_id, :picture, :topic, :link,
                                 :cover, :event, :starts_at, :ends_at)
  end
end
