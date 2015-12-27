class OccurrencesController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    if habit.create_occurrence!
      flash[:notice] = 'Success'
    else
      flash[:error] = 'Error'
    end
    redirect_to habit_url(habit)
  end
end
