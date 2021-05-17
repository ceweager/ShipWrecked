class UsersController < ApplicationController
  def index
    @users = if params[:query].present?
               User.search_by_username
             else
               User.all
             end
    @friendinvite = FriendshipInvite.new
  end

  def show
    @user = User.find(params[:id])
    @characters = Character.all.where(user: @user)
    @pending = FriendshipInvite.where(user_id: @user.id)
    @unaccepted = FriendshipInvite.where(friend_id: @user.id)
    @friends = [@pending, @unaccepted].flatten
  end
end
