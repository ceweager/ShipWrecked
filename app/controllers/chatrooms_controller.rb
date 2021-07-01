class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(user: current_user)
    @user = User.find(params[:user_id])
  end

  def show
    @chatroom = Chatroom.where(user: current_user).find(params[:id])
    @message = Message.new
  end

  def new
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    @chatroom.user = current_user
    @chatroom.partner = User.find(params[:user_id])
    if @chatroom.save
      redirect_to user_chatroom_path(current_user, @chatroom)
    else
      flash.alert = "You need to give your chatroom a name"
      redirect_to user_path(current_user)
    end
  end

  def destroy
    @chatroom = Chatroom.find(params[:id])
    @chatroom.destroy
    redirect_to user_path(current_user)
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:name)
  end
end
