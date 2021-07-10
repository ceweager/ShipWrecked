class MilestonesController < ApplicationController
  before_action :find_character, only: %i[new create edit update]
  before_action :find_goals, only: %i[new create edit update]
  before_action :find_milestone, only: %i[edit update destroy]

  def new
    @milestone = Milestone.new
  end

  def create
    @milestone = Milestone.new(milestone_params)
    if @milestone.save
      redirect_to user_character_path(current_user, @character)
    else
      render :new
    end
  end

  def edit; end

  def update
    @milestone.update(milestone_params)
    redirect_to user_character_path(current_user, @character)
  end

  def destroy
    @char_id = @milestone.goal.character_id
    @milestone.destroy
    redirect_to user_character_path(current_user, @char_id)
  end

  private

  def find_goals
    @goals = Goal.all.select { |goal| goal.character_id == @character.id }
  end

  def find_character
    @character = Character.find(params[:character_id])
  end

  def find_milestone
    @milestone = Milestone.find(params[:id])
  end

  def milestone_params
    params.require(:milestone).permit(:milestone_name, :photo, :model_overview, :goal_id)
  end
end
