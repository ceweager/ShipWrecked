class PostthreadsController < ApplicationController
  before_action :find_thread, only: [:update, :edit, :destroy]
  before_action :find_character, only: [:new, :create, :update, :edit]
  before_action :find_milestone, only: [:new, :create, :update, :edit]
  after_action :create_connects, only: [:create]

  def index
    @characters = current_user.characters
    @statuses = ["Not Started", "To Reply", "Waiting for Reply", "Completed"]
    filter_threads
  end

  def new
    @postthread = Postthread.new
    @statuses = ["Not Started", "To Reply", "Waiting for Reply", "Completed"]
    @relations = Relationship.where(character: @character)
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
    unless thread_params["thread_status"].empty?
      @postthread.update(thread_params)
      respond_to do |format|
        format.html { redirect_to referral_param}
        format.json { render json: { postthread: @postthread } }
      end
    end
  end

  def destroy
    @char_id = @postthread.milestone.goal.character_id
    @postthread.destroy
    redirect_to user_character_path(current_user, @char_id)
  end

  private

  def create_connects
    @relationships = params[:postthread][:relationships].reject { |r| r.empty? }
    @relationships.each do |relationship|
      relation = Relationship.find(relationship)
      connect = Connect.new(relationship: relation, postthread: @postthread)
      connect.save
    end
  end

  def find_character
    if params[:character_id].nil?
      @character = Character.find(@postthread.milestone.goal.character_id)
    else
      @character = Character.find(params[:character_id])
    end
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

  def referral_param
    params[:referrer]
  end

  def filter_threads
    @postthreads =  if params[:first_query].present? && params[:second_query].present?
                      Character.find(params[:first_query]).postthreads.where(thread_status: params[:second_query])
                    elsif params[:first_query].present?
                      Character.find(params[:first_query]).postthreads
                    elsif params[:second_query].present?
                      current_user.postthreads.where(thread_status: params[:second_query])
                    else
                      current_user.postthreads
                    end
  end
end
