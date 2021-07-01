class UsersController < ApplicationController
  def index
    @users = if params[:query].present?
               User.search_by_username(params[:query])
             else
               User.all
             end
    @friendinvite = FriendshipInvite.new
  end

  def show
    @user = User.find(params[:id])
    @friendinvite = FriendshipInvite.new
    @characters = Character.all.where(user: @user)
    @pending = FriendshipInvite.where(user_id: @user.id).where(friend_confirm: nil)
    @unaccepted = FriendshipInvite.where(friend_id: @user.id).where(friend_confirm: nil)
    @friends = FriendshipInvite.where("cast(friend_id as text) ILIKE :query OR cast(user_id as text) ILIKE :query", query: "#{@user.id}")
    @chatroom = Chatroom.new
    @chatrooms = Chatroom.where(user: current_user)
  end
end
