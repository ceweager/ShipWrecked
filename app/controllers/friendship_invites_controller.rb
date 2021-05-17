class FriendshipInvitesController < ApplicationController
  before_action :find_friendship_invite, except: [:new, :create]
  before_action :find_friend, except: [:destroy]


  def new
    @friendinvite = FriendshipInvite.new
  end

  def create
    @friendinvite = FriendshipInvite.new
    @friendinvite.user_confirm = true
    @friendinvite.user = current_user
    @friendinvite.friend = @friend
    if @friendinvite.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit; end

  def update
    @friendinvite.update(friend_confirm: true)
    redirect_to user_path(current_user)
  end

  def destroy
    @friendinvite.destroy
    redirect_to user_path(current_user)
  end

  private

  def friend_params
    params.require(:friendship_invite).permit(:user_confirm)
  end

  def find_friend
    @friend = User.find(params[:user_id])
  end

  def find_friendship_invite
    @friendinvite = FriendshipInvite.find(params[:id])
  end
end
