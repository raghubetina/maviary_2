class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]

  # GET /chats
  def index
    @chats = Chat.all
  end

  # GET /chats/1
  def show
    @message = Message.new
    @invitation = Invitation.new
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
  end

  # POST /chats
  def create
    @chat = Chat.new(chat_params)

    if @chat.save
      message = 'Chat was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @chat, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /chats/1
  def update
    if @chat.update(chat_params)
      redirect_to @chat, notice: 'Chat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chats/1
  def destroy
    @chat.destroy
    message = "Chat was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to chats_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def chat_params
      params.require(:chat).permit(:name, :creator_id, :picture, :topic, :link, :cover, :event, :starts_at, :ends_at)
    end
end
