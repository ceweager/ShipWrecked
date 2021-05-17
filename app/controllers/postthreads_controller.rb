class PostthreadsController < ApplicationController
  before_action :find_character, only: [:new, :create, :update, :edit]
  before_action :find_milestone, only: [:new, :create, :update, :edit]
  before_action :find_thread, only: [:update, :edit, :destroy]

  def index
    @postthreads = Postthread.all
  end

  def new
    @postthread = Postthread.new
    @statuses = ["Not Started", "To Reply", "Waiting for Reply", "Completed"]
  end

  def create
    @postthread = Postthread.new(thread_params)
    if @postthread.save
      redirect_to user_character_path(current_user, @character)
    else
      render :new
    end
  end

  def edit
    @statuses = ["Not Started", "To Reply", "Waiting for Reply", "Completed"]
  end

  def update
    @postthread.update(thread_params)
    redirect_to user_character_path(current_user, @character)
  end

  def destroy
    @char_id = @postthread.milestone.goal.character_id
    @postthread.destroy
    redirect_to user_character_path(current_user, @char_id)
  end

  private

  def find_character
    @character = Character.find(params[:character_id])
  end

  def find_thread
    @postthread = Postthread.find(params[:id])
  end

  def find_milestone
    @milestones = Milestone.all.select { |milestone| milestone.goal.character_id == @character.id }
  end

  def thread_params
    params.require(:postthread).permit(:thread_name, :thread_detail, :thread_status, :thread_link, :milestone_id)
  end
end
