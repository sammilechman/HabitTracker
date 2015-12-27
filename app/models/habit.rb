class Habit < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :occurrences, dependent: :destroy

  # Returns true if occurrence created successfully, false otherwise
  def create_occurrence!
    self.occurrences.create.persisted?
  end
end
