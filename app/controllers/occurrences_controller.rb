class OccurrencesController < ApplicationController
  def create
    habit = Habit.find(params[:habit_id])
    authorize!(:manage, habit)
    if habit.create_occurrence!
      flash_notice('Success')
    else
      flash_alert('Error')
    end
    redirect_to habits_url
  end

  def destroy
    habit = Habit.find(params[:id])
    authorize!(:manage, habit)
    if habit.delete_most_recent_occurrence!
      flash_notice('Success')
    else
      flash_alert('Error')
    end
    redirect_to habits_url
  end
end
