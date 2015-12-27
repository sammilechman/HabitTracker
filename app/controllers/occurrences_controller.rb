class OccurrencesController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    authorize!(:manage, habit)
    if habit.create_occurrence!
      flash[:notice] = 'Success'
    else
      flash[:alert] = 'Error'
    end
    redirect_to habits_url
  end
end
