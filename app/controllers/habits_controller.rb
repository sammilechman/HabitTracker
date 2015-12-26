class HabitsController < ApplicationController
  def new
    @habit = Habit.new
  end

  def create
    @habit = current_user.habits.new(habit_params)
    if @habit.save
      flash[:notice] = 'Success'
      redirect_to habit_url(@habit)
    else
      flash[:error] = 'Error saving Habit'
      redirect_to new_habit_url
    end
  end

  def show
    @habit = Habit.find(params[:id])
  end

  def index
    if user_signed_in?
      @habits = current_user.habits
    else
      redirect_to welcome_url
    end
  end

  private

  def habit_params
    params.require(:habit).permit(:title)
  end
end