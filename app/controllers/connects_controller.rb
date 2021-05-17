class ConnectsController < ApplicationController
  before_action :find_thread
  def new
    @connect = Connect.new()
    @relationships = current_user.relationships
  end

  def create
    @connect = Connect.new(connect_params)
    @connect.postthread = @thread
    if @connect.save
      redirect_to user_character_path(current_user, @connect.relationship.character)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def connect_params
    params.require(:connect).permit(:relationship_id)
  end

  def find_thread
    @thread = Postthread.find(params[:postthread_id])
  end
end
