class MessagesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    @message.readed = true
    @message.save
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      flash[:notice] = "Mensaje enviado."
      redirect_to root_path
    else
      flash[:alert] = "Error al enviar el mensaje."
      redirect_to root_path
    end
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:name, :email, :phone, :title, :message, :readed)
  end

end
