class GoalsController < ApplicationController
  before_action :find_character, only: [:new, :create, :edit, :update]
  before_action :find_goal, only: [:update, :edit, :destroy]

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.character = @character
    if @goal.save
      redirect_to user_character_path(current_user, @character)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @goal.update(goal_params)
    redirect_to user_character_path(current_user, @character)
  end

  def destroy
    @id = @goal.character_id
    @goal.destroy
    redirect_to user_character_path(current_user, @id)
  end

  private
  
  def find_goal
    @goal = Goal.find(params[:id])
  end

  def find_character
    @character = Character.find(params[:character_id])
  end

  def goal_params
    params.require(:goal).permit(:goal_name, :goal_detail)
  end
end
