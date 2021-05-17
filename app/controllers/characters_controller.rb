class CharactersController < ApplicationController
  before_action :find_character, only: [:show, :edit, :update, :destroy, :edit_overview,:edit_personality, 
                                        :edit_history,:edit_other]
  before_action :find_user, only: [:index, :show, :edit, :update,:edit_overview,:edit_personality, 
  :edit_history,:edit_other]
  skip_before_action :authenticate_user!, only: :index
  after_action :create_nil_goal_and_milestone, only: [:create]

  def index
    @characters = Character.all.where(user: @user)
  end

  def show
    @goals = @character.goals
    @milestones = count_milestones
    @threads = count_threads
    @completed_threads = find_completed_threads
    @percent_complete = calc_percent_complete
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    @character.user = current_user
    if @character.save
      redirect_to user_character_path(current_user, @character)
    else
      render :new
    end
  end

  def destroy; end

  def edit_overview; end

  def edit_personality; end

  def edit_history; end

  def edit_other; end

  def update
    @character.update(character_params)
    redirect_to user_character_path(@user, @character)
  end

  private

  def find_character
    @character = Character.find(params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def create_nil_goal_and_milestone
    @goal = Goal.create(character: @character, goal_name: "none")
    @milestone = Milestone.create(goal: @goal, milestone_name: "none")
  end

  def character_params
    params.require(:character).permit(:name, :age, :gender, :birthday, :sexuality, :positive, :negative, :personality, :history, :other, :overview, :character_pic)
  end

  def count_milestones
    @milestones = []
    @goals.each do |goal|
      goal.milestones.each { |milestone| @milestones << milestone }
    end
    @milestones
  end

  def count_threads
    @threads = []
    @milestones.each do |milestone|
      milestone.postthreads.each { |thread| @threads << thread }
    end
    @threads
  end

  def find_completed_threads
    if @threads.empty?
      0
    else
      @threads.count { |thread| thread.thread_status == "Completed" }
    end
  end

  def calc_percent_complete
    @threads.empty? ? 0 : @completed_threads.fdiv(@threads.count)
  end
end
