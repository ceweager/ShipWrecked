class RelationshipsController < ApplicationController
  before_action :find_character, only: %i[new create edit update]
  before_action :find_relationship, only: %i[edit update destroy]
  def new
    @relationship = Relationship.new
  end

  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.character = @character
    if @relationship.save
      redirect_to user_character_path(current_user, @character)
    else
      render :new
    end
  end

  def edit; end

  def update
    @relationship.update(relationship_params)
    redirect_to user_character_path(current_user, @character)
  end

  def destroy
    @id = @relationship.character_id
    @relationship.destroy
    redirect_to user_character_path(current_user, @id)
  end

  private

  def find_character
    @character = Character.find(params[:character_id])
  end

  def find_relationship
    @relationship = Relationship.find(params[:id])
  end

  def relationship_params
    params.require(:relationship).permit(:relation_name, :relation_status, :relation_pic, :relation_detail)
  end
end
